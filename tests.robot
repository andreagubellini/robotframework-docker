***Settings****
Library     SeleniumLibrary

***Test Cases***
Opens browser
     ${list} =     Create List    --no-sandbox
     ${args} =     Create Dictionary    args=${list}
     ${desired caps} =     Create Dictionary    chromeOptions=${args}
     Open Browser    https://www.google.com    browser=Chrome    desired_capabilities=${desired caps} 
     element should be visible     id:hplogo
     ${element}=    get webelement   css:[data-pid="2"]
     ${text}=  get text  ${element}
     log to console   \n ${text}