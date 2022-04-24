*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${CARRINHO_TITLE}        Order - My Store
${CARRINHO_DELETAR}      xpath=//*[@class="cart_quantity_delete"]
${CARRINHO_MSG_VAZIO}    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']


*** Keywords ***

#### Ações

Excluir o produto do carrinho
    Title Should Be    ${CARRINHO_TITLE}
    Wait Until Element Is Visible    ${CARRINHO_DELETAR}
    Click Element      ${CARRINHO_DELETAR}


#### Conferências

Conferir se o carrinho fica vazio
    Wait Until Element Is Visible   ${CARRINHO_MSG_VAZIO}
    Element Text Should Be          ${CARRINHO_MSG_VAZIO}    Your shopping cart is empty.
