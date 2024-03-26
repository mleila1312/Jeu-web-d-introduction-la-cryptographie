# Le Grand Chiffre

Jusqu'à l'utilisation du Grand Chiffre, les codes étaient souvent des méthodes de substitution mono (comme César) ou poly-alphabétiques (comme Vignère). Leur problème est qu'il est assez facile de les déchiffrer grâce à de la cryptanalyse puisque chaque lettre est encodée. Si ces méthodes étaient largement suffisantes pour certains usages, les communications militaires du XVIIe siècle avaient besoin de chiffrement plus robuste. Les chiffrements monoalphabétiques  étaient bien trop peu sécurisés,  et les chiffrements polyalphabétiques étaient trop complexes dans leur utilisation.

_Détour : chiffrement homophonique_
Une des faiblesses du chiffrement monoalphabétique est l'analyse fréquentielle. On peut introduire des redondances dans l'alphabet pour que chaque symbole représente 1% du texte, mais ce n'est pas suffisant (par exemple, q est presque toujours suivi par u, donc il est facile à identifier). Pour éviter "le cas q", on peut chiffrer les sons plutôt que les lettres, et éventuellement introduire des redondances. On obtient ainsi un chiffrement homophonique. (à noter qu'un chiffrement homophonique est monoalphabétique car un son est toujours encodé par un nombre fixe de symboles). Le chiffrement homophonique est donc plus sécurisé qu'un chiffrement mono-alphabétique classique, mais beaucoup plus simple à utiliser qu'un chiffrement poly-alphabétique. 


_NB : je n'ai pas réussi à trouver plus complet que cette image_

<center>
<img src="https://upload.wikimedia.org/wikipedia/commons/8/89/Great_Cipher.png" width="350"/>
</center>

Antoine Rossignol et son fils Bonaventure créèrent alors le Grand Chiffre pour Louis XIV. (exemple au dessus) Ils étaient les seuls à en connaître les détails, donc le Grand Chiffre est tombé en désuétude après leur mort, et il fallu plus de deux siècles aux cryptanalystes du monde entier pour réussir à déchiffrer les documents chiffrés par le Grand Chiffre.

Etienne Bazeries a réussi, le premier, à décoder le Grand Chiffre à la fin du XIXe siècle. Il découvrit que le Grand Chiffre codait en réalité les syllabes grâce à 587 symboles, et que non seulement certains symboles étaient redondants, mais aussi certains symboles permettait d'ignorer le symbole précédant, tout cela dans le but d'induire le cryptanalyste en erreur. Par exemple, (exemple fameux, puisque c'est celui-ci qui permit de décoder le Grand Chiffre) 124-22-125-46-345 veut dire "les ennemis".

### Histoire
Antoine Rossignol et son fils Bonaventure créèrent alors le Grand Chiffre pour Louis XIV. (exemple au dessus) Ils étaient les seuls à en connaître les détails, donc le Grand Chiffre est tombé en désuétude après leur mort, et il fallu plus de deux siècles aux cryptanalystes du monde entier pour réussir à déchiffrer les documents chiffrés par le Grand Chiffre.  

 Ils furent recrutés aux services de Louis XIII après avoir, en 1626, déchiffré des lettres cryptées ennemies, ce qui permit à l'armée du Roi de reconquérir une ville contrôlée alors par une armée ennemie sans grosse pertes, l'armée ennemie se rendit. L'importance de la cryptographie était alors devenue évidente pour le Roi et ses politiques. Sous le règne de Louis XIV, toujours aux services du roi, ils inventèrent le Grand Chiffre afin que les communications sensibles, messages de la plus haute importance, puissent être chiffrés. Les archives de France restèrent illisibles pendant près de 2 siècles, jusqu'à ce qu'en 1890, un historien soumette les écrits à Etienne Bazeries, qui était considéré comme le meilleur cryptanalyste militaire de l'époque. Il découvrit que le Grand Chiffre codait en réalité les syllabes grâce à 587 symboles, et que non seulement certains symboles étaient redondants, mais aussi certains symboles permettait d'ignorer le symbole précédant, tout cela dans le but d'induire le cryptanalyste en erreur. Par exemple, (exemple fameux, puisque c'est celui-ci qui permit de décoder le Grand Chiffre) 124-22-125-46-345 veut dire "les ennemis".

Ce chiffrement est connu pour une raison particulière (en plus du fait que de nombreux écrits du roi était chiffré avec cette méthode) : l'identité de l'homme au masque de fer a peu être été révélée lors du décryptage des communications secrètes.  
#### L'histoire de l'homme au masque de fer ?
L'homme au masque de fer à d'abord été emprisonné à la forteresse de Pignerol en Savoie, puis fut transféré à la Bastille en 1968. Personne ne connaissait son identité, des habitants aux alentours avaient seulement pu l'apercevoir marcher sur les remparts avec un masque de fer. Beaucoup de théories du complot ont vue le jour sur son sujet, notament sur le fait que cette personne était le jumeau secret du roi, et de nombreux écrits également en furent inspirés.

#### Quelle est son identité ?
Une lettre écrite par Louvois, ministre de la Guerre, une fois décryptée, contenait ce texte :  
  
 "Sa Majesté voit mieux que personne les conséquences de cet acte, et est consciente du préjudice qu'il a porté à notre cause en ne réussissant pas à prendre la place, un échec qu'il va falloir réparer durant l'hiver.  
Sa Majesté désire que vous arrêtiez immédiatement le général de Bulonde, et qu'il soit conduit à la forteresse de Pignerol, où il sera enfermé dans une cellule gardée la nuit, et où il pourra se promener sur les remparts dans la journée, en portant un 330 309"  

A l'époque, Bazeries supposa que 330 signifiait masque, et que 309 signifiait le point. Cependant, nous ne pouvons être certains que l'identité de l'homme au masque de fer est bien révélée. Le Grand Chiffre ne contenait pas de code pour  le mot ennemi, pourquoi contiendrait-il celui du mot masque? Et de plus, il apparaît que Bulonde était encore en vie en 1708 alors que Voltaire indiquait que l'homme au masque de fer était mort en 1703.  

Il n'empêche que cette lettre décryptée a beaucoup intrigué les historiens.