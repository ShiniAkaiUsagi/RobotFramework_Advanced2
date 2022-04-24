def imprimir_coelho():
    print("___()()\n___('')\n___(uu)o")

def imprimir_cenoura():
    print("___\|/\n___(_)\n___|_|\n___ V")

def coelho_alimentado(resp):
    if resp  ==  "sim":
        print("___() ()\n___(>.o)")
        return "Coelho está alimentado"
    else:
        print("___() ()\n___(>.<)")
        return "Alimente o coelho"