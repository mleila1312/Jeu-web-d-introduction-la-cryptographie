# crypte un texte avec le chiffre de Vigenere

def lettre(c):
    # retourne vrai si c est une lettre non accentuee
    car = ord(c.upper())
    return car>64 and car<91

def decalage(c,k):
    # decale une lettre majuscule. Les autres caracteres ne sont pas modifies
    car = ord(c.upper())
    if lettre(c):
        car += k
        while car>90:
            car -= 26
        while car<65:
            car += 26
        return chr(car)
    else:
        return ""

def vigenere(message,cle,crypte):
    # effectue le decalage en fonction de la cle sur les caracteres de message
    n = 0
    chiffre=''
    for c in message:
        if lettre(c):
            k = ord(cle[n%len(cle)])-65
            if crypte:
                chiffre += decalage(c,k)
            else:
                chiffre += decalage(c,-k)
            n+=1
        else:
            chiffre += c
    return chiffre


# tests
cle = "VIE"
texte="Hwr Mwm wqii-imhm, Xza qjbw nwro crz lspki hmpjlmz yyd nedb zdjvzz qjv gjmym, crz uigwhdm hjcgz, crz uigwhdm gcmvz. Ri hm pvvkpqw hwm vcwnq hz kin qrnbeibw qwpza, pjqr ymw mmkvzhn agmcxvbipzw, gwmi lin wvzqpgmw hipqmmgteibw. Vkgzxxz usi pyhjpz igxwvy mx kmvhmxn-usd l'iozi gm vzxmo yyz by xpimklza, upm xp linqvza. Hvvw g'wqwzi ym pv vydb, rja wzkvzbw nmvjvx ymw zbsdtin jvdtpvvxza, io vsn zmmmw, ymw ewcvcb dvinbmhifgmw, ymw ewcvcb zuimdidtpza. Nz b'eobiilvvq eqmg dutvbmzvgz.I nvueda xdmrim,Kvjvdmpgm"
texte_code = vigenere(texte,cle,True)
print(texte_code)
texte_decode = vigenere(texte_code,cle,False)
print(texte_decode)