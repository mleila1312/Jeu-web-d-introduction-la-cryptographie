# Cryptanalyse de la méthode de César

## Introduction

La méthode de César, bien que simple, peut être facilement cassée à l'aide de techniques de cryptanalyse. Dans cette section, nous détaillons quelques méthodes courantes pour décrypter un message chiffré avec la méthode de César.

## Attaque par force brute

L'une des méthodes les plus simples pour casser un message chiffré avec la méthode de César est l'attaque par force brute. Étant donné qu'il n'y a que 25 décalages possibles dans l'alphabet (à l'exception du décalage de 0 qui est équivalent au texte en clair), un attaquant peut simplement essayer chaque décalage possible jusqu'à ce que le message soit déchiffré avec succès.

## Analyse des fréquences (Al-Kindi au IXème)


## Analyse des fréquences et l'apport d'Al-Kindi

Une méthode plus sophistiquée pour casser la méthode de César est l'analyse des fréquences, qui repose sur le fait que certaines lettres sont plus courantes que d'autres dans une langue donnée. Cette technique est attribuée à Al-Kindi, un mathématicien et cryptographe arabe du IXe siècle.

Al-Kindi est célèbre pour son ouvrage intitulé "Manuscrit sur le déchiffrement des messages cryptographiques", dans lequel il a décrit en détail diverses méthodes de cryptanalyse, y compris l'analyse des fréquences. Dans son travail, Al-Kindi a souligné que les lettres de la langue arabe n'ont pas toutes la même fréquence d'apparition et a développé des techniques pour exploiter ces différences afin de casser des chiffres de substitution comme celui de César.

Cette approche implique de compter la fréquence d'apparition de chaque lettre dans le message chiffré, puis de comparer ces fréquences avec celles des lettres dans la langue cible. En se basant sur les probabilités d'occurrence des lettres, un cryptanalyste peut faire des suppositions éclairées sur le décalage utilisé dans le chiffrement de César.

Par exemple, en français, la lettre la plus fréquente est généralement "e". En trouvant la lettre la plus fréquente dans le message chiffré, un attaquant peut estimer le décalage.

## Analyse des paires de lettres

Une autre technique consiste à analyser les paires de lettres dans le message chiffré. Par exemple, dans certaines langues, certaines paires de lettres sont plus fréquentes que d'autres (comme "le" en français). En trouvant ces schémas dans le message chiffré, un attaquant peut déduire le décalage utilisé.

## Implémentation de l'attaque par force brute


```python
def decrypter_par_force_brute(message_chiffre):
    for decalage in range(1, 26):
        message_clair = ""
        for lettre in message_chiffre:
            if lettre.isalpha():
                decalage_base = ord('A' if lettre.isupper() else 'a')
                message_clair += chr((ord(lettre) - decalage_base - decalage) % 26 + decalage_base)
            else:
                message_clair += lettre
        print("Décalage {}: {}".format(decalage, message_clair))
```

## Sources
https://etablissementbertrandeborn.net/IMG/pdf/indice9_maths.pdf

