# Chiffre de Vernam - aussi appelé le masque jetable

## Présentation
Code de Vigenère, avec des obligations sur le choix de la clé :
- aussi longue que le texte
- parfaitement aléatoire
- à usage unique

## Histoire
Créé en 1926 par Gilbert Vernam, ingénieur au laboratoire de recherche de la compagnie "American Telephone & Telegraph".

Ce chiffre n'est que très peu utilisé à cause de la difficulté de sa mise en œuvre :
- les clés doivent être extrêmement longues !
- on doit éditer des livres entiers de clés à usage unique et les distribuer secrètement (un exemplaire entre les mains de l'ennemi et c'est foutu, mais un livre c'est vachement dur à planquer)
- l'émetteur et le récepteur doivent être synchrones : si un message de l'émetteur se perd, ils vont se décaler dans les clés utilisées, et c'est foutu...

Résultat : Il fut ainsi utilisé pour sécuriser le téléphone rouge, ligne directe entre la Maison Blanche et le Kremlin du temps de la guerre froide. Les clés circulaient dans les valises diplomatiques, transportées dans des avions bourrés d'agents secrets. 

## Craquage ?
Claude Shannon a prouvé en 1949 que ce chiffre est parfaitement sûr, et que tout chiffre parfaitement sûr est nécessairement une variante du chiffre de Vernam. 


## Idées pour l'implémenter
En vrai, pas sur le code lui-même vu qu'on a déjà du Vigenère, mais on peut faire un truc autour du transport des clés (genre tu es un espion chargé de déplacer la valise diplomatique, tu spot tous les gens chelous - j'imagine vraiment un jeu où tu vois juste des personnes assises dans l'avion, de temps en temps une tête cheloue pop, il faut que tu cliques dessus pour la faire disparaître)