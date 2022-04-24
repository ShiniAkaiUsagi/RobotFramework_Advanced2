*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
# ${BROWSER}      headlesschrome
# Por linha de comando: robot -V BROWSER:headlesschrome

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser