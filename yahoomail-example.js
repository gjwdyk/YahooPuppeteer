import puppeteer from 'puppeteer';
import neatCsv from 'neat-csv';
import fs from 'fs';
import {createCursor} from 'ghost-cursor';
import UserAgent from 'user-agents';
import https from 'https';



const initialURL = 'https://de.yahoo.com/';
const chromePathFile = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const credentialPathFile = '.\\Credential.csv';



const chromeOptions = {
  executablePath: chromePathFile,
  headless: false,
  defaultViewport: null,
  args: [ '--start-maximized' ],
  ignoreHTTPSErrors: true,
  acceptInsecureCerts: true
};



(async () => {
  var userID = '';
  var userPassword = '';
  await fs.readFile(credentialPathFile, async (err, data) => {
    if (err) {
      console.error(err);
      return;
    };
    var dataCsv = await neatCsv(data);
    //console.log(data);
    //console.log(dataCsv);
    //console.log(dataCsv[0].UserID);
    //console.log(dataCsv[0].Password);
    userID = dataCsv[0].UserID;
    userPassword = dataCsv[0].Password;
  });

  const browser = await puppeteer.launch(chromeOptions);

  var userAgent = new UserAgent({ deviceCategory: 'desktop' }).toString();
  var context = await browser.createIncognitoBrowserContext();
  var page = await context.newPage();
  await page.setUserAgent(userAgent);
  await page.setViewport({width: 0, height: 0});
  await installMouseHelper(page);
  var ghostcursor = createCursor(page);

  await page.goto(initialURL);

  // Click the Accept-All
  var selector = "button[class='btn secondary accept-all ']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);

  // Click the Mail link at the top right corner, at this point, it leads to Yahoo advertisement with no escape
  //var selector = "a[id='ybarMailLink']";
  //await page.waitForSelector(selector);
  //await ghostcursor.move(selector);
  //await ghostcursor.click(selector);

  // Click the Anmelden link to Login
  var selector = "div[id='ybarAccountProfile']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);
  // or the below also works but the class name looks a dynamically generated field name
  //var selector = "a[class='_yb_1koxw']";
  //await page.waitForSelector(selector);
  //await ghostcursor.move(selector);
  //await ghostcursor.click(selector);

  console.log("User ID : ",userID);
  console.log("Password : ",userPassword);

  var selector = "div[id='username-country-code-field']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);
  var selector = "input[id='browser-fp-data']";
  await page.focus(selector);
  await page.type(selector, userID, {delay: 22});
  var selector = "input[id='login-signin']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);

  var selector = "input[id='login-passwd']";
  await page.focus(selector);
  await page.type(selector, userPassword, {delay: 22});
  var selector = "button[id='login-signin']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);



  await page.waitForTimeout(55555);



  // Click the Mail link at the top right corner
  var selector = "a[id='ybarMailLink']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);

  // Click the one row of eMail. Can not identify point to specific one like the first row.
  var selector = "tr[data-test-id='message-list-item']";
  await page.waitForSelector(selector);
  await ghostcursor.move(selector);
  await ghostcursor.click(selector);



  await page.waitForTimeout(987654321);

  await page.close();
  await context.close();
  await browser.close();

})();



async function installMouseHelper(page) {
  await page.evaluateOnNewDocument(() => {
    // Install mouse helper only for top-level frame.
    if (window !== window.parent)
      return;
    window.addEventListener('DOMContentLoaded', () => {
      const box = document.createElement('puppeteer-mouse-pointer');
      const styleElement = document.createElement('style');
      styleElement.innerHTML = `
        puppeteer-mouse-pointer {
          pointer-events: none;
          position: absolute;
          top: 0;
          z-index: 10000;
          left: 0;
          width: 20px;
          height: 20px;
          background: rgba(0,0,0,.4);
          border: 1px solid white;
          border-radius: 10px;
          margin: -10px 0 0 -10px;
          padding: 0;
          transition: background .2s, border-radius .2s, border-color .2s;
        }
        puppeteer-mouse-pointer.button-1 {
          transition: none;
          background: rgba(0,0,0,0.9);
        }
        puppeteer-mouse-pointer.button-2 {
          transition: none;
          border-color: rgba(0,0,255,0.9);
        }
        puppeteer-mouse-pointer.button-3 {
          transition: none;
          border-radius: 4px;
        }
        puppeteer-mouse-pointer.button-4 {
          transition: none;
          border-color: rgba(255,0,0,0.9);
        }
        puppeteer-mouse-pointer.button-5 {
          transition: none;
          border-color: rgba(0,255,0,0.9);
        }
      `;
      document.head.appendChild(styleElement);
      document.body.appendChild(box);
      document.addEventListener('mousemove', event => {
        box.style.left = event.pageX + 'px';
        box.style.top = event.pageY + 'px';
        updateButtons(event.buttons);
      }, true);
      document.addEventListener('mousedown', event => {
        updateButtons(event.buttons);
        box.classList.add('button-' + event.which);
      }, true);
      document.addEventListener('mouseup', event => {
        updateButtons(event.buttons);
        box.classList.remove('button-' + event.which);
      }, true);
      function updateButtons(buttons) {
        for (let i = 0; i < 5; i++)
          box.classList.toggle('button-' + i, buttons & (1 << i));
      }
    }, false);
  });
};


