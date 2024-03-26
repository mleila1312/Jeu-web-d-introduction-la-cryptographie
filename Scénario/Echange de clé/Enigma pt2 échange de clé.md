*Objectifs : après avoir cassé Enigma terrestre, démontrer le risque des clés symétriques en volant le livre de la marine allemande.*

# Objets

## 1 page : Etiquette 
Rappels pour les nouveaux venus : 
- image : Ceci est un logo de commandant, vous devez donc vous adresser à votre supérieur avec le bon titre : "commandant"
- image : Ceci est un logo de caporal, vous devez donc vous adresser à votre supérieur avec le bon titre : "caporal"
- image : Ceci est un logo de général, vous devez donc vous adresser à votre supérieur avec le bon titre : "général".
rajouter des précision sur hiérarchie etc

## 1 page : tâches de la journée

- 5h30 : Lever, douche, petit-déjeuner
- 6h : Cirage de chaussure, faire le lit
- 6h30 laver le sol du sous-marins, complimenter son supérieur car il est pas du matin
- 7h : apporter un café a son supérieur
- 7h10 : Faire ses tâches professionnelles de la journée
- 11h30 : cuisiner le repas
- 12h : repas du midi, finir les restes du général si il y en a pour ne pas gâcher et se remettre en question quant à ses qualités de cuisinier
- 12h30 : reprendre ses tâches professionnelles
- 18h40 : faire le repas du soir avec plus d'attention que le midi
- 19h10 : repas du soir, de même que le midi quant au général
- 19h30 : faire les lessives des affaires de vos compatriotes
- 20h : rester vigilant, surveiller le radar
- 4h30 : dormir

## Image collée au mur 
Saucisses dans un coeur

## Carte affichée au mur

<img src= "https://gitlab.telecom-paris.fr/proj104/jeu-crypto/-/blob/main/Sc%C3%A9nario/Echange%20de%20cl%C3%A9/iles.jpg" width = "350"/>


# Introduction

Flashback avec Turing qui explique les différences de Enigma de la marine :
"Les machine Enigma de la marine allemande utilisaient 4 rotors et non 3, et on devait choisir parmi 8 rotors et non 5. Cela fait beaucoup trop de possibilités pour pouvoir casser cette version d'Enigma, même avec nos bombes... En plus de cela, les soldats de la marine étaient méticuleux pour qu'il soit difficile de deviner la clé. Heureusement, l'espoir n'est pas perdu, il suffirait de réussir à se procurer les configurations chaque jour. Plus facile à dire qu'à faire. "

On voit des officiers allemands recevant le livre des clés par jour pour Enigma. 
"Au fil de la guerre, les machines Enigma de la marine ont été améliorées. Le nombre de rotors a progressivement augmenté. Si les bombes permettaient de déchiffrer les machine Enigma en 10 minutes, il faudrait plus de 30 heures pour déchiffrer les machines Enigma de la marine."
*image du livre ouvert*
"Il faut absolument que je puisse voler ce livre !"

# Scène 1

Le joueur est téléporté dans un U-boot (il incarne un espion)
Il va devoir trouver les coordonnées d'une base marine allemande pour y voler le carnet de clés. Il s'est pour cela introduit dans un sous marin de la marine allemande. Il est face à un tableau avec des îles (cf image). A côté du tableau il y a un carnet avec trois page.
1. Logo commandant / caporal / général
2. A 8h, à ..., à 10h :, .....
3. SAUCISSE + <3

En se déplaçant dans le sous-marin, il rencontre trois allemands

## Premier allemand
Un général de l'armée allemande. 3 options de dialogue possible :
1. Bonjour mon caporal !
2. Bonjour mon commandant !
3. Bonjour mon général !
Si il a juste : coordonnées d'une île xA
Sinon tunnel sur le respect de l'autorité

## Deuxième allemand
Il y a un autre allemand avec une grosse montre, on peut cliquer dessus pour avoir l'heure. Trois options "Nouvelle recrue, as tu bien +étape ?"
1. Je l'ai fait il y a une heure
2. Je le ferai demain --> tunnel
3. Je le ferai dans 30 minutes.
Si c'est bon, "A moi de te tester, tu connais la coordonnée de l'île ?" (yB)

## Troisième allemand

"Vu que c'est toi qui t'occupes de la cuisine ce soir, quel est notre plat préféré ? T'as pas intérêt à te rater."
1. ??
2. SAUCISSE
3. ??
Erreur --> tunnel sur la gastronomie allemande
Sinon "si tu veux plus de sauce, dis moi yC"


Le joueur en déduit les coordonnées de la base (comme c'est un espion il n'en avait pas connaissances contrairement aux allemands). Il peut se diriger vers la base dans une salle avec une croix directionnelle + affichage des co (éventuellement un radar)

# Scène 2
Le joueur est arrivé sur la base militaire en pleine mer. Il doit à présent réussir à obtenir un objet qui lui permet de récupérer le carnet de clés. Trouver un chemin en regardant des indices sur la vue. S'il se trompe il est démasqué. Phase de labyrinthe pour rentrer dans la base. Il peut à chaque fois aller tout droit, à gauche ou a droite 

## Principe du labyrinthe 
Le joueur arrivera à des croisements. Il se dira "encore une étape...". Devant chaque direction possible, se trouvera une icône (ex : lampe, coffre aux trésors, etc). Au début, il devra suivre les icônes montrant un plan. Une fois arriver au bout, il se trouvera dans une salle vide, avec un papier au sol, indiquant un ordre d'icônes à suivre pour arriver à la base. Il devra ensuite suivre ces icônes dans l'ordre pour pouvoir enfin pénétrer dans la base.  
Petit piège : si il suit les icônes coffre au trésors trois fois, il arrivera dans une salle au trésor, et lorsqu'il cliquera pour récupérer l'argent, le trésor se révèlera être un monstre, qui va le tunnel sur le fait qu'il est choisi l'argent plutôt que sa mission, qu'il devrait avoir honte, puis va le manger, telle la société mange le travailleur. Il se retrouvera téléporté au début du labyrinthe ayant eu l'impression d'avoir fait un mauvais rêve et étant soudainement très motivé pour faire sa mission.


# Scène 3

Il arrive dans une salle avec ?? machines Enigma. Au moment où il rentre une alarme sonne et tous les allemands vont manger. Il est seul dans la pièce et doit résoudre des trucs :
Le nouveau carnet contenant les clés pour la marine allemande est prêt à être envoyé, il est placé dans une boite fermée avec un code au milieu de la pièce.  

le code de la boite est composé de 3 signes, chaque signe est associé à une couleurs (en gros, le joueur pourra sélectionner le signe qu'il veut en cliquant sur la zone d'entrée, comme pour les cadenas, et la zone d'entrée est d'une certaine couleur)
 - couleur 1 : Le joueur devra trouver un câble en métal, et l'utiliser pour réparer un projecteur/lumière violette, qui une fois branché, allumé, et que la lumière de la pièce est été éteinte, affichera sur le mur le symbole correspondant à la zone d'entrée (violette si lumière violette)
 - Mini-jeu : Le joueur devra mettre du bon côté des panneau sur une armoire qui contiendra d'ailleurs la câble en métal (en cliquant dessus il pourra les retourner) afin d'afficher un dessin sur le dessus. Un fois que le dessin aura été affiché, l'armoire s'ouvrira, il y aura gravé dans le fois de l'armoire le symbole correspondant à la couleur cherchée (symbole en couleur).
 - Balance : il y a divers objets ornés de symboles, le joueur devra équilibrer la balance, une fois qu'il l'aura équilibré,  les objets n'ayant pas le symbole cherché disparaitront.
 Une fois que le joueur à donc tous les symboles il pourra ouvrir le coffre et voler le carnet.


# Scène 4

Lorsqu'il ouvre le coffre, il trouve le carnet, et l'ouvre par curiosité. A la première page, il remarque, gribouillé, des coordonnées temporelles avec le message "tu es lent, je suis arrivé avant toi". Le joueur rentre alors les coordonnées dans machine et il arrive à la nouvelle étape.