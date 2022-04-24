*** Settings ***
Resource   ../Resource.robot
Library    SeleniumLibrary
Library    String


*** Variables ***
${CADASTRO_FIELD_EMAIL}        id=email_create
${CADASTRO_BTN_CRIARCONTA}     id=SubmitCreate
${CADASTRO_FORMULARIO}         xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${CADASTRO_BOX_GENERO_F}       id=id_gender2
${CADASTRO_BOX_GENERO_M}       id=id_gender1
${CADASTRO_FIELD_NOME}         id=customer_firstname
${CADASTRO_FIELD_SOBRENOME}    id=customer_lastname
${CADASTRO_FIELD_SENHA}        id=passwd
${CADASTRO_FIELD_ENDERECO_1}   id=address1
${CADASTRO_FIELD_CIDADE}       id=city
${CADASTRO_LISTBOX_ESTADO}     id=id_state
${CADASTRO_FIELD_CEP}          id=postcode
${CADASTRO_FIELD_TELEFONE}     id=phone_mobile
${CADASTRO_BTN_CADASTRAR}      submitAccount
${CADASTRO_SUCESSO_CADASTRO}   xpath=//p[@class='info-account'][contains(.,'Welcome to your account. Here you can manage all of your personal information and orders.')]
${CADASTRO_TXT_USERNAME}       xpath=//*[@id="header"]/div[2]//div[1]/a/span  


# Formulário

${CADASTRO_TXT_NOME}        May
${CADASTRO_TXT_SOBRENOME}   Fernandes
${CADASTRO_TXT_SENHA}       123456
${CADASTRO_TXT_ENDERECO}    Rua Framework, Bairro Robot
${CADASTRO_TXT_CIDADE}      Floripa
${CADASTRO_TXT_CEP}         12345
${CADASTRO_TXT_ESTADO}      9
${CADASTRO_TXT_TELEFONE}    99988877


*** Keywords ***

#### Ações

Informar um e-mail válido
    Wait Until Element Is Visible   ${CADASTRO_FIELD_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${CADASTRO_FIELD_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button                    ${CADASTRO_BTN_CRIARCONTA}

Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${CADASTRO_FORMULARIO}
    Click Element                   ${CADASTRO_BOX_GENERO_F}
    Input Text                      ${CADASTRO_FIELD_NOME}         ${CADASTRO_TXT_NOME}
    Input Text                      ${CADASTRO_FIELD_SOBRENOME}    ${CADASTRO_TXT_SOBRENOME}
    Input Text                      ${CADASTRO_FIELD_SENHA}        ${CADASTRO_TXT_SENHA}
    Input Text                      ${CADASTRO_FIELD_ENDERECO_1}   ${CADASTRO_TXT_ENDERECO}
    Input Text                      ${CADASTRO_FIELD_CIDADE}       ${CADASTRO_TXT_CIDADE}
    Set Focus To Element            ${CADASTRO_LISTBOX_ESTADO}      
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    Run Keyword If                  '${BROWSER}'=='firefox'
    ...                             Wait Until Element Is Visible  ${CADASTRO_LISTBOX_ESTADO}
    Click Element                   ${CADASTRO_LISTBOX_ESTADO}
    Select From List By Index       ${CADASTRO_LISTBOX_ESTADO}     ${CADASTRO_TXT_ESTADO}
    Input Text                      ${CADASTRO_FIELD_CEP}          ${CADASTRO_TXT_CEP}
    Input Text                      ${CADASTRO_FIELD_TELEFONE}     ${CADASTRO_TXT_TELEFONE}

Submeter cadastro
    Click Button                    ${CADASTRO_BTN_CADASTRAR}


#### Conferências

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${CADASTRO_SUCESSO_CADASTRO}
    Element Text Should Be           ${CADASTRO_SUCESSO_CADASTRO}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           ${CADASTRO_TXT_USERNAME}       ${CADASTRO_TXT_NOME} ${CADASTRO_TXT_SOBRENOME}
