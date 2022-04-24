*** Settings ***
Library     DiffLibrary

*** Test Cases ***
Checar se arquivos iguais são iguais
    Checar arquivos    ./modulo03/arquivo_PDF.pdf    ./modulo03/arquivo_PDF2.pdf

Checar se arquivos diferentes são iguais
    Checar arquivos    ./modulo03/arquivo_TEXTO.txt  ./modulo03/arquivo_TEXTO2.txt    

*** Keywords ***

Checar arquivos
    [Arguments]    ${file_one}    ${file_two}
    Diff Files     ${file_one}    ${file_two}    fail=false     #hihi

# 16:41:40.772	INFO	1c1
# < Esse curso vai me tornar um ninja em Robot Framework!!!!
# \ No newline at end of file
# ---
# > A May vai me tornar um ninja em Robot Framework!!!!
# \ No newline at end of file