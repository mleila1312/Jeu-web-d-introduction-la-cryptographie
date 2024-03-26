# Man in the middle (MITM) ou Attaque de l'homme au milieu

## Introduction 

En cryptographie et en sécurité informatique, une attaque de l'homme du milieu (MITM pour Man in the middle) ou attaque sur le chemin est une cyberattaque où l'attaquant relaie secrètement et éventuellement modifie les communications entre deux parties qui pensent qu'elles communiquent directement entre elles, car l'attaquant s'est interposé entre les deux parties.

Un exemple d'attaque MITM est l'écoute active, dans laquelle l'attaquant établit des connexions indépendantes avec les victimes et relaie des messages entre elles pour les faire croire qu'elles communiquent directement entre elles via une connexion privée, alors que toute la conversation est en fait contrôlée par l'attaquant. Dans ce scénario, l'attaquant doit être capable d'intercepter tous les messages pertinents échangés entre les deux victimes et d'en injecter de nouveaux. Cela est réalisable dans de nombreuses situations; par exemple, un attaquant dans la portée de réception d'un point d'accès Wi-Fi non chiffré pourrait se placer en tant qu'homme du milieu.

Comme elle vise à contourner l'authentification mutuelle, une attaque MITM ne peut réussir que lorsque l'attaquant se fait passer pour chaque point d'extrémité de manière suffisamment convaincante pour satisfaire leurs attentes. La plupart des protocoles cryptographiques incluent une forme d'authentification des points d'extrémité spécifiquement pour prévenir les attaques MITM. Par exemple, TLS peut authentifier l'une ou les deux parties en utilisant une autorité de certification mutuellement fiable.

## Exemple

<center>
<img src="https://www.pandasecurity.com/fr/mediacenter/src/uploads/2022/04/man-in-the-middle-attack-FR_02-Phases-of-man-in-middle-attack.png"/>
</center>

Supposons qu'Alice souhaite communiquer avec Bob. Pendant ce temps, Mallory souhaite intercepter la conversation pour écouter (violant la confidentialité) avec la possibilité de transmettre un faux message à Bob sous l'apparence d'Alice (violant la non-répudiation). Mallory effectuerait une attaque de l'homme du milieu comme décrit dans la séquence d'événements suivante.
Alice envoie un message à Bob, qui est intercepté par Mallory :

Alice "Salut Bob, c'est Alice. Donne-moi ta clé." →     Mallory     Bob

Mallory transmet ce message à Bob; Bob ne peut pas dire que ce n'est pas vraiment d'Alice :

Alice     Mallory "Salut Bob, c'est Alice. Donne-moi ta clé." →     Bob

Bob répond avec sa clé de chiffrement :

Alice     Mallory     ← [Clé de Bob] Bob

Mallory remplace la clé de Bob par la sienne et transmet cela à Alice, prétendant que c'est la clé de Bob :

Alice     ← [Clé de Mallory] Mallory     Bob

Alice chiffre un message avec ce qu'elle pense être la clé de Bob, pensant que seul Bob peut le lire :

Alice "Retrouve-moi à l'arrêt de bus !" [chiffré avec la clé de Mallory] →     Mallory     Bob

Cependant, parce qu'il a été réellement chiffré avec la clé de Mallory, Mallory peut le déchiffrer, le lire, le modifier (si désiré), le rechiffrer avec la clé de Bob et le transmettre à Bob :

Alice     Mallory "Retrouve-moi près de la camionnette au bord de la rivière !" [chiffré avec la clé de Bob] →     Bob

Bob pense que ce message est une communication sécurisée d'Alice.

Cet exemple montre la nécessité pour Alice et Bob d'avoir un moyen de s'assurer qu'ils utilisent véritablement les clés publiques l'un de l'autre, et non la clé publique d'un attaquant. Sinon, de telles attaques sont généralement possibles, en principe, contre n'importe quel message envoyé en utilisant la technologie de clé publique.
