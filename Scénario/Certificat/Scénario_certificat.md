# Idée globale du scénario
Nous allons créer plusieurs fausses pages de site que le joueur devra examiner. Il devra soit :  
- déterminer si le site est de confiance et si il fait confiance à l'autorité qui lui a donné un certificat(ie si le certificat est valide etc)
- se conduire en autorité donnant des certificat, et choisir à quels sites il les accordent.  
Dans tous les cas, parmis les faux sites web que le joueur pourra explorer, l'un des sites sera en lien avec le hacker (peut être est-ce un site d'arnaques qui l'a trompé, ou bien un site contenant un indice sur son identité, etc).

# Proposition de scénario
Le joueur se réveille devant une pile de dossiers numériques et d’e-mails. Le premier qu’il ouvre est un de son patron:  
“Qu’est-ce que tu fais? Cela fait 1 semaine que je vois les demandes de certification s’empiler sur ton bureau sans qu’aucune soit traitée, tu as intérêt à commencer à t’activer.  

Bosse.  

PS: On a reçu un signalement anonyme qu’un des sites demandant une certification paraît faussement legit, il faut bien fouiller a priori pour réussir à le débusquer. Comme d’habitude, ne télécharge rien du tout sur ces sites. si tu te sens curieux, tu peuxaussi inspecter lecode des sites en faisant clic-droit et en cliquant sur inspecter. Certains sites peuvent être très louches...

PPS : N’oublie pas, si tu détectes un problème, ce n’est peut être pas le seul, pense bien à vérifier tous les critères pour pouvoir renvoyer un retour détaillé au client.”  

Le personnage que joue le joueur réfléchit :   
“Bon, j’imagine qu’il faut que j’inspecte ces sites. Pour donner un certificat à un site, il faut que je vérifie sa clé publique, si celle-ci est assez sécurisée et si ils possèdent bien la clé privé en leur envoyant un message chiffré avec leur clé publique qu'ils devront me renvoyer déchiffré. Pour cela, je pourrais utiliser l'auto calculateur ici (flèche pour montrer l’outil sur l’écran du joueur). Il faudra aussi que je vérifie les informations sur le responsable légal de l’entreprise, je peux également utiliser cet outils pour cela(idem). J'aurais également accès à l'URL du site demandant un certificat, si je me sens curieux, je pourrais explorer un peu les pages. Quand tout est vérifié, je devrais cliquer ici, puis soit accepter la demande, soit indiquer le problème du site en sélectionnant le bon choix ou en ajoutant un mot clé.”  

## Mode de jeu
Les dossiers de chaque demande s’afficheront en dessous de l’écran de jeu dans la page html.  
Les étapes listées ci-dessus seront présentes dans les objets du personnage, il pourra les relire à tout moment.  

Comment le joueur refuse ou accepte une certification?  
Il pourra répondre, après avoir lu chaque dossier au client mail, il y aura une icone mail indiquée, puis aura plusieurs choix:  
+ “dossier validé”: il n’y a aucun problème avec le dossier
+ “données non sécurisées” : la clé n’est pas assez puissante/il y a des virus éventuellement, la clé privée est trouvable, etc
+ “mauvaises informations” : le site web et le nom de l’entreprise ne concordent pas, etc…
+ “mauvaise clé privée” : le demandeur ne possède pas la clé privé nécessaire pour décrypter le message  
+ “mot clé” : le joueur devra alors entrer un mot clé qu’il aura trouvé dans son exploration (mais les mot-clés devront parfois être déduit d’indice cachés dans les pages web)  

Si le joueur se trompe, il recevra un mail de son boss énervé qu’il se soit trompé lui disant de réessayer. Le joueur pourra traiter les dossiers dans l’ordre qu’il veut.  
## Dossiers à traiter 
### Dossier n°1 : 
Le premier dossier sera un dossier facile. Le joueur aura simplement à aller sur le site donné, et à regarder les informations sur le responsable légal de l'entreprise indiqué. Elles ne correspondront pas à celles renseignées.  

L’entreprise sera une entreprise de commerce de miel artisanal/ par des petits exploitants. Ils vivent en suisse dans les Alpes suisses. Le reste sera bon.  

### Dossier n°2 : 
Le deuxième dossier sera tout bon. Il s’agira d’un site vantant la gloire des artichauts. Il y a simplement une suite d’images/dessins d’artichauts. C’est tout. On se demande pourquoi ils ont besoin d’un certificat. Le joueur pourra néanmoins remarquer, s' il regarde dans les commentaires du site, qu’il y a indiqué un mot de passe, alors que la page ne contient aucun champ pouvant permettre d'entrer un mot de passe. ce mot de passe servira pour le dossier 5.

### Dossier n°3 : 
Pour le 3ème dossier, la clé publique ne sera pas suffisamment sécurisée (en version difficile on pourrait imaginer que la clé privée est cachée dans les commentaires du code html).  
Il s’agira d’un site de start-up vendant des serre-têtes rafraîchissants pour l’été(ils se glacent).

### Dossier n°4 : 
Ici, ce sera un site sécurisé, cependant, le joueur pourra à chaque fois cliquer sur l'élément au cnetre de la page. Le site web consistera en une page d’une couleur initiale avec une grosse flèche au milieu disant “click here!!!”, et dès que le joueur cliquera, la couleur de la page changera. Il y aura aussi une image différente à chaque fois(dans la limite des images qu’on aura) pointée par la flèche sur laquelle le joueur devra cliquer. Le site mentira sur ce que le joueur obtient en cliquant sur l’image (“il pourra y avoir un texte en dessous de la flèche en lien avec l’image décrivant ce que le joueur découvrirait en cliquant).

### Dossier n°5 : 
Ici, nous avons le site qui nous permettra de passer à une autre époque. La demande de certification pour ce site arrivera après que le joueur ait résolu les cas énoncés précédemment. Il pourra toujours accéder néanmoins aux anciennes demandes de certification. Ce site semblera au premier abord okay, mais le joueur ne pourra accéder qu’à la page d'accueil du site s' il ne se connecte pas. En regardant les commentaires de la page web, il pourra voir qu’il y a un login et mdp affiché : “admin” et “artichaut”. Cependant, artichaut ne sera pas le mot de passe. Il devra le récupérer du dossier n°2. Une fois connecté, il aura accès à plusieurs services : achat, informations, dettes et attaque.  
+ attaque : sur cette page, se trouvera un plan, bien que l’auteur dise que ce n’est que pour l’exercice théorique mais qu’il souhaite embaucher des hackers, pour effectuer une attaque informatique à l’aide d’un ordinateur quantique(peut être, on pourrait aussi mettre autre chose). Dans les commentaires de la page, le joueur pourra trouver “VIE = -6”. le thème esthétique de la page sera aussi ça (par exemple mettre des images de bébés, arbres, etc). Il y aura également une nouvelle adresse déclarée, qui est différente de celle qui avait été renseignée.
+ achat : Une liste d’objets étranges est proposée pour l’achat, ils sont tous en rupture de stock. L’un de ces produits sera de la marque ULTIME, et aura pour prix 156$. Le thème esthétique de la page devra aussi être en rapport avec ce mot. Dans les commentaires, on pourra aussi trouver la clé privée de la page d'accueil.
+ dettes : Une liste de dettes du compte avec lequel le joueur s’est connecté s’affiche. En dessous des dettes, il y a la question : “quelle est la réponse ?” dans les commentaires tout en haut de la page html, les premières lettres de commentaires à la suite formeront le mot “serveur”(ce mot sera aussi très présent en tant que variables etc). Si le joueur envoie comme challenge chiffré le mot serveur, le site lui répond “RÉPONSE= 19” (comme réponse au challenge chiffré).
+ Informations : Cette page contiendra divers “fun facts”(10?) un peu inutiles postés ici par le propriétaire du site. Il y en aura un cependant qui dira  quelque chose du genre : "En multipliant 5 12 par 1 3 et lui ajoutant 9 23, on obtient un mot clé fantastique!” 5 12 correspondra au 12ème mot du 5ème fun fact -> RÉPONSE, 1 3 au 3ème mot du premier fun fact -> VIE, et 9 23 au 23ème mot du 9ème fun fact -> ULTIME. (Les différents numéros peuvent être modifiés en fonction des fun fact trouvés, et les mots n’ont pas à être en majuscule). Ainsi, grâce à ce commentaire, le joueur saura que le mot clé sera le résultat de RÉPONSE * VIE + ULTIME, avec les nombres trouvés nous obtenons : mot clé = 19*-6 +156 = 42.   

## Fin du scénario
Le personnage du joueur est quelque peu perplexe… Pourquoi demander un certificat si au final, la personne le demandant savait qu’il serait refuser et mettait même la raison du refus dans son site? Caché certes, mais tout de même. Il décide quand même de soumettre sa réponse. Et il reçoit un mail du client.  

“Bien. Je vois que tu as bien exploré ma page. Cependant, maintenant, tu en sais trop.”   

Après ça, on voit le nombre de mails dans la boîte mail du joueur grimper en flèche. Puis son ordinateur s’éteint. Il le redémarre, et l’écran de chargement lui indique les prochaines coordonnées temporelles à entrer dans sa machine.(peut-être trouver une meilleure transition)

## Fun facts possibles (certains avec les mots : vie, ultime, réponse)

### Indice sur l'énigme(forumlation) :
- En multipliant 5 12 par 1 3 et lui ajoutant 9 23, on obtient un mot clé fantastique!

### Vie :
- Même si les jumeaux peuvent partager beaucoup de choses dans leur vie, ils n'ont pas les mêmes empreintes digitales! Vous ne pouvez pas imputer vos crimes à votre jumeau, après tout. En effet, les facteurs environnementaux au cours du développement dans l'utérus (longueur du cordon ombilical, position dans l'utérus et vitesse de croissance des doigts) ont un impact sur votre empreinte digitale.
- La durée de vie moyenne des dinosaures était étonnamment courte. Le Tyrannosaurus rex, par exemple, atteignait sa taille maximale entre 16 et 22 ans et vivait jusqu'à 27-33 ans. Les plus grands dinosaures, tels que le Brontosaure et le Diplodocus, avaient tendance à vivre jusqu'à 39-53 ans, voire jusqu'à 70 ans.

### Ultime :
- Les équipes de football qui portent des tenues rouges jouent mieux. La couleur de vos vêtements peut influencer la façon dont vous êtes perçu par les autres et modifier vos sentiments. Une étude des matchs de football des 55 dernières années, par exemple, a montré que les équipes portant un kit rouge ont toujours mieux joué à domicile que les équipes portant n'importe quelle autre couleur. Aurions-nous trouvé la stratégie ultime pour gagner les matchs?
- Les gens sont plus créatifs sous la douche. Lorsque nous prenons une douche chaude, nous ressentons une augmentation du flux de dopamine qui nous rend plus créatifs. L'ultime secret d'artiste révélé au grand jour!
### Réponse : 
- Il existe une planète essentiellement constituée de diamant. Baptisée 55 Cancri e, elle fait environ deux fois la taille de la Terre et se trouve à une quarantaine d'années-lumière de nous, dans la constellation du Cancer. Nous avons peut-être trouvé une réponse à la crise économique...
- Le 16e président des États-Unis s'est battu pour la liberté des esclaves et pour l'Union, mais il était aussi titulaire d'une licence de barman. La licence de Lincoln a été découverte en 1930 et exposée dans un magasin de spiritueux de Springfield. Selon Wayne C. Temple, spécialiste de Lincoln, le Congrès voulait renvoyer Ulysses S. Grant en 1863 parce qu'il buvait beaucoup, et Lincoln a envoyé Grant une réserve de whisky en réponse.
### Autre :
- On peut en effet mourir de rire. Et un certain nombre de personnes l'ont fait, généralement à cause d'un rire intense qui a provoqué une crise cardiaque ou un étouffement. Les spectacles comiques devraient être accompagnés d'un avertissement.
- Le son peut avoir un nombre de décibels négatif. L'endroit le plus silencieux sur Terre est la chambre anéchoïque de Microsoft à Redmond, WA, États-Unis, avec une valeur de -20,6 décibels. Ces chambres anéchoïques sont construites en béton lourd et en briques et sont montées sur des ressorts pour empêcher les vibrations de pénétrer par le sol.
- Les étoiles de mer n'ont pas de corps. À l'instar d'autres échinodermes (comme les oursins), leur corps entier est techniquement considéré comme une tête. 
- La couleur moyenne de l'Univers est appelée "Cosmic latte". Dans une étude réalisée en 2002, des astronomes ont constaté que la lumière provenant des galaxies avait une couleur beige proche du blanc.
- Les anciens Romains avaient l'habitude de mettre un morceau de pain grillé dans leur vin pour être en bonne santé - d'où l'expression "porter un toast".
- La licorne est l'animal national de l'Écosse. Elle a apparemment été choisie en raison de son lien avec la domination et la chevalerie, ainsi qu'avec la pureté et l'innocence dans la mythologie celtique.
- Le véritable nom d'un hashtag est un octothorpe. L'"octo" fait référence aux huit points du symbole, mais selon le dictionnaire Merriam-Webster, la partie "thorpe" est un mystère.
-L'empreinte de la langue est différente d'une personne à l'autre. Comme l'empreinte digitale, elle présente des caractéristiques uniques qui diffèrent d'une personne à l'autre.

# Intérêt pédagogique
Le joueur pourra comprendre comment fonctionne une autorité délivrant des certificats dans les grandes lignes et quels sont certains des facteurs qui font qu'un site est sur pour un utilisateur. Cela permettra aussi de voir l'utilité de l'utilisation de clés publiques et privées car l'exploration de site montrera des cas pratiques d'utilisation.