import puppeteer from 'puppeteer';
import neatCsv from 'neat-csv';
import fs from 'fs';
import {createCursor} from 'ghost-cursor';
import UserAgent from 'user-agents';
import https from 'https';



const chromeOptions = {
  executablePath: 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe',
  headless: false,
  defaultViewport: null,
  ignoreHTTPSErrors: true,
  acceptInsecureCerts: true
};

(async () => {
  const browser = await puppeteer.launch(chromeOptions);
  var randomData = {};

  for (let counter = 0 ; counter <= 333 ; counter++) {
    randomData = {};
    await getRandomWord(randomData);
    console.log(counter, '   ', await randomData["First"], '   ', await randomData["Second"]);

    var userAgent = new UserAgent({ deviceCategory: 'desktop' }).toString();
    var context = await browser.createIncognitoBrowserContext();
    var page = await context.newPage();
    await page.setUserAgent(userAgent);
    await page.setViewport({width: 1920, height: 1080});
    await installMouseHelper(page);
    var ghostcursor = createCursor(page);

    await page.goto('https://acleda.xc.aadc.link/trading/login.php');

    var selector = "input[name='username']";
    await page.waitForSelector(selector);
    await ghostcursor.move(selector);
    await ghostcursor.click(selector);
    await page.type(selector, randomData["First"]);

    var selector = "input[name='password']";
    await page.waitForSelector(selector);
    await ghostcursor.move(selector);
    await ghostcursor.click(selector);
    await page.type(selector, randomData["Second"]);

    var selector = "button[class='btn btn-primary']";
    await page.waitForSelector(selector);
    await ghostcursor.move(selector);
    await ghostcursor.click(selector);

    await page.waitForTimeout(4321);
  
    await page.close();
    await context.close();

  };

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



function getRandomWord(responseData) {
  //var https = require("https");
  //import https from 'https';

  var options = {
    hostname: "random-word-api.herokuapp.com",
    port: 443,
    path: "/word?number=2",
    method: "GET"
  };
  console.log("External API Call Attempt for Random Word: " + JSON.stringify(options));
  var request = https.request(options, function(response) {
    console.log("External API Call Attempt Status Code: " + response.statusCode);
    console.log("External API Call Attempt Response Headers: " + JSON.stringify(response.headers));
    var body = "";
    response.on("data", function(chunk) {
      body += chunk;
    });
    response.on("end", function() {
      console.log(body);
      var FirstResult = body.substring( 0, body.indexOf(",") );
      console.log(FirstResult);
      var SecondResult = body.substring( ( body.indexOf(",") + 1 ) , body.length );
      console.log(SecondResult);
      responseData["First"] = FirstResult.substring( ( FirstResult.indexOf("\"") + 1 ), FirstResult.lastIndexOf("\"") );
      console.log(responseData["First"]);
      responseData["Second"] = SecondResult.substring( ( SecondResult.indexOf("\"") + 1 ), SecondResult.lastIndexOf("\"") );
      console.log(responseData["Second"]);
    });
  });
  request.on("error", function(error) {
    console.log("External API Call Error:\n" + error);
  });
  request.end();
}


