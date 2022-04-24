# Não consegui utilizar o post on session

*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             String
Library             SeleniumLibrary
Library             OperatingSystem
Resource            ./variables/my_user_and_passwords.robot


*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues


*** Test Cases ***

Desafio: Criar comentário em uma Issue
    Conectar com autenticação por token na API do GitHub
    Comentar na Issue de número "12" 
    Consultar comentários da issue "12"


*** Keywords ***
Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    ...                                      Accept=Accept=application/vnd.github.squirrel-girl-preview
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True

Confere sucesso na requisição
    [Arguments]         ${RESPONSE}
    Should Be True      '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}

Comentar na Issue de número "${ISSUE_INDEX}"
    ${BODY}             Format String        ${CURDIR}/data/input/comment.json
    ${HEADERS}          Create Dictionary    Accept=Accept=application/vnd.github.squirrel-girl-preview
    ${MY_COMMENT}       POST Request         alias=mygithubAuth    uri=${ISSUES_URI}/${ISSUE_INDEX}/comments
    ...                                      data=${BODY}
    Confere sucesso na requisição            ${MY_COMMENT}

Consultar comentários da issue "${ISSUE}"
    ${MY_ISSUES}        GET On Session       alias=mygithubAuth    url=${ISSUES_URI}/${ISSUE}
    Log                                      Comments: ${MY_ISSUES.json()}
    Confere sucesso na requisição            ${MY_ISSUES}

# Comentar na Issue de número "${ISSUE}"
#     ${BODY}             Create Dictionary    data=Comentário cadastrado via Robot Framework!
#     ${MY_COMMENT}       POST On Session      mygithubAuth    ${ISSUES_URI}/${ISSUE}/comments
#     ...                                      json={"body": "${BODY.data}"}
#     Confere sucesso na requisição            ${MY_COMMENT}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Comentar na Issue de número "${ISSUE}"
#     ${BODY}             Format String        ${CURDIR}/data/input/comment.json
#     Create Session      mygithubAuth         url=${GITHUB_HOST}
#     ${MY_COMMENT}       POST On Session      mygithubAuth    ${ISSUES_URI}/${ISSUE}/comments
#     ...                                      json=${BODY}
#     Confere sucesso na requisição            ${MY_COMMENT}
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #