***Settings****
Library     SeleniumLibrary
***Test Cases***
tests Firefox
     Open browser   https://google.com/    Chrome
     element should be visible     id:hplogo
     ${element}=    get webelement   css:[data-pid="2"]
     ${text}=  get text  ${element}
     log to console   \n ${text}
tests Chrome
     Open browser   https://google.com/    Firefox
     element should be visible     id:hplogo
     ${element}=    get webelement   css:[data-pid="2"]
     ${text}=  get text  ${element}
     log to console   \n ${text}
***Keywords***
Open browser
    [Arguments]   ${url}    ${browser}
    Run Keyword If  "${browser}"=="Firefox"  Open firefox browser   ${url}
    ...     ELSE    Open Chrome browser   ${url}

Open Chrome browser
  [Arguments]    ${url}
  ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
  Call Method    ${chrome_options}    add_argument    --disable-extensions
  Call Method    ${chrome_options}    add_argument    --disable-gpu
  Call Method    ${chrome_options}    add_argument    --no-sandbox
  Create Webdriver    Chrome    chrome_options=${chrome_options}
  Set Window Size  1920  1280
  Go To    ${url}
Open firefox browser
  [Arguments]    ${url}
  ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
  Call Method    ${firefox_options}    add_argument    --no-sandbox
  Create Webdriver  Firefox  executable_path=geckodriver  firefox_options=${firefox_options}
  set window Size  1920   1280
  Go To  ${url} 