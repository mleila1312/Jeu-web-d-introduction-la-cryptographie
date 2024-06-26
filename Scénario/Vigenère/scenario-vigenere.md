**Petite remarque :** normalement le texte est déjà rédigé de sorte qu'il puisse être utilisé 

# Transition entre le chiffre de César et le chiffre de Vigenère 

Bien que les failles de la cryptographie par substitution soient connues depuis longtemps, aucun nouveau procédé cryptographique réellement sécurisé (pour l'époque) et facile à utiliser n'a émergé entre l'époque de César et le XVIe siècle ! 

# Petit point historique 

Blaise de Vigenère, né en 1523, fut pionnier dans l'élaboration d'une méthode de chiffrement qui défia les cryptanalystes pendant trois siècles : le chiffre de Vigenère. Figure aux multiples talents, il jonglait entre les rôles d'alchimiste, d'écrivain, d'historien et de diplomate au service des ducs de Nevers et des rois de France. Ce n'est qu'en 1586 qu'il dévoila son nouveau système de chiffrement, connu sous le nom de chiffre de Vigenère, dans son ouvrage intitulé "Traicté des chiffres, ou Secrètes manières d'escrire".

# Mise en place du contexte

Bienvenue dans le rôle d'Antoine de Montaigne, personnage central de notre jeu de cryptographie en pleine Renaissance !

Vigenère, éminent cryptographe, a servi de nombreux rois, dont Henri IV. Ce souverain, régnant sur la France de 1589 à 1610, est particulièrement connu pour ses intrigues amoureuses, notamment avec Gabrielle d'Estrées, une favorite influente qui a donné naissance à plusieurs enfants légitimés. Gabrielle est souvent considérée comme l'une des maîtresses les plus notables d'Henri IV.

Henri IV et Gabrielle souhaitent maintenir leur relation secrète et éviter que leur correspondance ne soit lue par des yeux indiscrets. C'est pourquoi ils ont eu l'idée de chiffrer leurs lettres. Henri IV et Gabrielle se sont alors échangé les clés de chiffrement, et le roi lui a expliqué le fonctionnement du chiffrement offert par Vigenère.

## Sur le personnage

Vous êtes le confident privilégié du roi, un homme d'origine noble, issu d'une famille respectée dans la France du XVIe siècle. Né dans la magnificence de la Renaissance, vous possédez une intelligence vive et une éducation soignée, rendant hommage aux traditions familiales. Vos traits distingués et votre politesse raffinée font de vous un personnage parfaitement adapté aux intrigues de la cour.

Votre lien avec Henri IV remonte à l'enfance, une complicité forgée dans les jardins du château royal. Lorsque Henri accéda au trône, il fit appel à vous comme confident. Votre rôle va au-delà de la simple observation : vous êtes un conseiller dévoué, capable d'allier loyauté envers le roi et souci du bien-être du royaume. Votre vie s'est déroulée au carrefour des intrigues de cour, de la diplomatie délicate et de l'amitié sincère avec le roi. Votre nom est respecté à la cour, et votre influence discrète fut un pilier important pour Henri IV, marquant ainsi une page tumultueuse de la Renaissance française.

# Mission Chiffrement

Votre mission en tant qu'Antoine de Montaigne est cruciale : Henri IV a rédigé une lettre passionnée, mais le fastidieux travail de chiffrement nécessite votre expertise. Votre mission consiste à chiffrer l'intégralité de cette lettre.

_Remarque : pour pouvoir réaliser sa mission le joueur doit avoir en main les éléments suivants :_

- _une explication du principe du chiffre de Vigenère_
- _la clé de chiffrement_
- _la lettre à chiffrer_
- _le tableau de correspondances permettant d'accélérer le processus de chiffrement_

_La lettre à chiffrer va être directement fournie par Henri IV. Une page de notes de Vigenère sur le fonctionnement de son chiffre avec un tableau de correspondances vont se retrouver dans un coffret. La clé de chiffrement sera a retrouvé également par le biais d'un énigme._

_Le joueur se retrouve dans une salle d'escape game qui ressemble à un bureau abandonné. Sur le bureau, il y a une vieille machine à écrire et un livre de poésie ouvert. Sur les murs sont accrochés côte à côte 4 peintures._

## Enigme 1 : ouvrir le coffret pour pouvoir accéder aux notes de Vigenère expliquant le principe de son chiffre

_Outil : livre de poésie ouvert et les 4 peintures._ 

_Le coffret est fermé par un cadenas qui s'ouvre après avoir saisi la bonne combinaison de quatre chiffres._

_Dans le livre de poésie ouvert, le joueur trouve un poème intitulé "Les Saisons de l'Amour". Le poème est écrit de manière à ce que certains mots soient mis en évidence en étant écrits en gras._

**Les Saisons de l'Amour**

Dans le jardin de mon cœur,

S'épanouissent les fleurs du bonheur.

Chaque pétale évoque un souvenir,

Chaque bourgeon un désir.

**Le printemps, temps de renouveau,**

Où chaque éclat de rire est un cadeau.

**L'été, brûlant de passion,**

Où nos cœurs battent à l'unisson.

**L'automne vient avec sa mélancolie,**

Les feuilles tombent, comme une symphonie.

**L'hiver, froid et solitaire,**

Mais nos cœurs demeurent solidaires.

Dans chaque saison, dans chaque temps,

Notre amour demeure, éternellement.


_Par ailleurs, quatre tableaux sont exposés côte à côte, représentant clairement chacun l'une des quatre saisons. Le premier représente l'hiver, le deuxième le printemps, le troisième l'été et le quatrième l'automne._

_Solution de l'énigme : Le joueur doit comprendre que chaque mot (printemps, été, automne, hiver) est un indice pour la combinaison. En leur attribuant des chiffres selon leur ordre d'apparition dans la poésie (ici, printemps = 1, été = 2, automne = 3, hiver = 4), ils peuvent former une séquence numérique. Ensuite, l'ordre des chiffres est établi en se basant sur l'ordre des tableaux accrochés au mur. Tout d'abord, le tableau correspondant à l'hiver est affiché, donc le chiffre 4 est positionné en premier, puis le tableau suivant correspondant au printemps, donc le chiffre suivant est le chiffre 1, et ainsi de suite. Ainsi, le code formé est 4123._

_Cette combinaison 4123 permet d'offrir le coffret et d'accéder aux notes de Vigenère, ainsi qu'au tableau de correspondances permettant d'encoder plus rapidement les messages._

## Enigme 2 : retrouver la clé de chiffrement 

_Clé de chiffrement : coeur._

_Outil : machine à écrire_

_Le joueur sera que la clé de chiffrement correspond à la forme géométrique du puzzle assemblé. D'abord, il devra retrouver tous les bouts du puzzle dans la chambre et, ensuite, en les rassemblant il s'apercevra que la forme de ce dernier est un coeur._ 

_Le joueur examine la machine à écrire et remarque qu'il y a des lettres qui sont plus usées que d'autres. En alignant ces lettres, le joueur arrive à former le mot-clé._Clé

_Donc, les lettres usées corresponderont alors à C, O, E, U, R._

## Chiffrage de la lettre

La lettre et la clé sont désormais entre vos mains, et vous êtes familiarisé avec le principe de chiffrement à appliquer.

Plongez-vous dans cette aventure palpitante et veillez à ce que les secrets d'Henri IV demeurent bien protégés. Bonne chance, Antoine de Montaigne !


**Voici la lettre :**

Ma chère Gabrielle,

En ces temps tourmentés, ton sourire illumine mes jours. Accorderas-tu la grâce d'une soirée en ma compagnie, loin des intrigues de la cour ? Ta présence est un réconfort que je désire.

Avec tout mon amour,
Henri

**Voici la lettre chiffrée avec la clé COEUR :**

OO GBVTS KUSTWIFCG, 

SR WVU HIGGU HSOIOSRNVU, HSH JQIVCIG WPFLOWRY DGG NILTG. EWTQFHYICG-XO CC UVUTG R'YHV UCMLVG SR GR ECQJRIBMY, CQWR XVU WRNIKUYYJ FS PU TQIV ? NR RFIMVPQI YJV IR LVECRZFTH UOV LS HYJKFI. 

EPVE HSOK OCR UDQIV, BVPFM

_Remarque : Le joueur n'aura pas à chiffrer toute la lettre, mais seulement le début (trop long, et sans grande valeur pédagogique). Le reste de la lettre chiffrée se complétera automatiquement._

# Cryptanalyse

Après avoir crypté la lettre, le roi attend avec impatience la réponse de Gabrielle. 

Mais lorsqu'il reçoit la réponse, il s'aperçoit qu'il a perdu la clé qu'a utilisé Gabrielle pour chiffer sa lettre réponse. 

Dans son désespoir, Henri IV se tourne vers son confident, le joueur, Antoine de Montaigne, déjà familiarisé avec le chiffre de César et son cryptanalyse par la méthode fréquentielle. 

_L'idée consiste à pousser le joueur à retrouver une méthode de cryptanalyse du chiffre de Vigenère à partir de celle du chiffre de César et plus précisément de l'analyse fréquentielle._

**Lettre à déchiffrer**

Hwr Mwm wqii-imhm,

Xza qjbw nwro crz lspki hmpjlmz yyd nedb zdjvzz qjv gjmym, crz uigwhdm hjcgz, crz uigwhdm gcmvz. Ri hm pvvkpqw hwm vcwnq hz kin qrnbeibw qwpza, pjqr ymw mmkvzhn agmcxvbipzw, gwmi lin wvzqpgmw hipqmmgteibw. Vkgzxxz usi pyhjpz igxwvy mx kmvhmxn-usd l'iozi gm vzxmo yyz by xpimklza, upm xp linqvza. Hvvw g'wqwzi ym pv vydb, rja wzkvzbw nmvjvx ymw zbsdtin jvdtpvvxza, io vsn zmmmw, ymw ewcvcb dvinbmhifgmw, ymw ewcvcb zuimdidtpza. Nz b'eobiilvvq eqmg dutvbmzvgz.

I nvueda xdmrim,
Kvjvdmpgm

**Pour pouvoir déchiffrer la lettre, il faut retrouver sa clé de chiffrement !**

## Etape 1 : retrouver la longueur de la clé sachant que le roi se rappelle qu'elle est plus petite que 5 et plus grande que 2

Hwr Mwm wqii-imhm,

Xza qjbw nwro **crz** lspki hmpjlmz yyd nedb zdjvzz qjv gjmym, **crz uigwhdm** hjcgz, **crz uigwhdm** gcmvz. Ri hm pvvkpqw hwm vcwnq hz kin qrnbeibw qwpza, pjqr **ymw** mmkvzhn agmcxvbipzw, gwmi lin wvzqpgmw hipqmmgteibw. Vkgzxxz usi pyhjpz igxwvy mx kmvhmxn-usd l'iozi gm vzxmo yyz by xpimklza, upm xp linqvza. Hvvw g'wqwzi ym pv vydb, rja wzkvzbw nmvjvx **ymw** zbsdtin jvdtpvvxza, io vsn zmmmw, **ymw** ewcvcb dvinbmhifgmw, **ymw** ewcvcb zuimdidtpza. Nz b'eobiilvvq eqmg dutvbmzvgz.

I nvueda xdmrim,

Kvjvdmpgm

_En raisonnant sur les multiples (nombres de chiffres entre chaque répétition successive), le joueur arrive à conclure que la clé est de longueur 3._

## Etape 2 : retrouver la clé à l'aide de l'analyse fréquentielle

_La méthode de cryptanalyse par analyse fréquentielle est rappellée au joueur. Le joueur doit comprendre qu'il faut se ramener à cette méthode de cryptanalyse. Dans l'onglet aide est fournie l'indication d'effectuer une subdivision par tranches avant d'effectuer l'analyse fréquentielle._

_Un outil d'analyse fréquentielle serait fourni._

**Solution : VIE**

_Le joueur pourra directement tester sa clé et afficher la version déchiffrée avec la clé saisie._

**Lettre déchiffrée**

Mon Roi bien-aimé,

Tes mots sont une douce mélodie qui fait vibrer mon cœur, une mélodie douce, une mélodie chère. Je me languis moi aussi de ces instants volés, loin des regards scrutateurs, loin des oreilles malveillants. Accepte mon humble accord et permets-moi d'être le répit que tu cherches, que tu désires. Dans l'ombre de la nuit, nos secrets seront des étoiles brillantes, et nos rires, des joyaux inestimables, des joyaux émerveillés. Je t'attendrai avec impatience.

À jamais tienne,
Gabrielle



