*** Settings ***
Library         ./Libraries/PedroLibrary/geradorCoelho.py

*** Test Cases ***

Exibir um coelho feliz
    Criar um coelho feliz
    Dar cenoura para o coelho
    Verificar se coelho está alimentado    sim
    Verificar se coelho está alimentado    talvez

*** Keywords ***

Criar um coelho feliz
    Imprimir Coelho

Dar cenoura para o coelho
    Imprimir Cenoura

Verificar se coelho está alimentado
    [Arguments]    ${resp}
    ${resultado}   Coelho Alimentado    ${resp}
    log    ${resultado}
    