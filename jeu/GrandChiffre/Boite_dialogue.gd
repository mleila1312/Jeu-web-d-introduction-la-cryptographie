extends CanvasLayer

#Contient une partie des dialogues du jeu qui sont facilement accessibles grâce au dictionnaire ci-dessous
var dialogues ={
	0 : "Ma tête est lourde, si lourde... Oh doux sommeil, pourquoi me quitte tu si tôt!",
	1 : "Qu'est-ce que..? Qui me tape sur la tête? Qui est-ce?",
	2: "L'homme s'exprime alors : \"Qu'est-ce que tu fais la à t'assoupir, nous avons un travail dantesque à accomplir. Le Grand Chiffre n'est pas n'importe quel chiffrement!\"",
	3 : "Comme tu le sais, c'est une méthode de chiffrement qui substitue une ou plusieurs lettres par un nombre. Mais aussi la ponctuation !",
	4 : "Nous nous y intéressons car elle a été beaucoup utilisée durant le règne de Louis XIV, et nous n'avons pas pu découvrir le contenu de beaucoup de ses correspondances.",
	5 : "Cela cré un vide historique terrible! Que ce soit au niveau des stratégies militaires ou même simplement de la vie à cette époque, nous pourrions découvrir beaucoup de choses en les déchiffrant!",
	6 : "Tu devais réfléchir à des stratégies pour déchiffrer les textes mais on dirait que tu as préféré passer une bonne nuit. Bon, sur quoi as-tu travaillé durant ma semaine d'absence?",
	7 : "Euuuuuuh, alors...." ,
	(-1) : "Sur rien dis-tu ? Tu n'as travaillé sur rien ? ",
	(-2) : "Mais sais-tu que le travail assidu possède une valeur inestimable, comme les grandes figures de la philosophie n'ont cessé de le répéter à travers les âges ? Comme Karl Marx nous l'a si profondément enseigné, le travail est bien plus qu'une simple activité économique.",
	(-3) : "C'est le moyen par lequel nous façonnons nos vies, notre société et notre destinée collective.
Dans chaque lueur de lumière matinale sur les champs labourés, dans chaque bureau où les esprits s'aiguisent et créent, nous voyons le reflet",
(-4) : " de cette valeur. Le travail assidu est la pierre angulaire sur laquelle reposent les édifices de progrès et de réussite. C'est la voie par laquelle nous transformons les rêves en réalités tangibles.",
(-5) : "Comme Platon l'a exprimé avec éloquence, \"le prix de la perfection est la pratique constante\". Chaque heure, chaque jour que nous consacrons à nos efforts, nous rapproche de la maîtrise de notre art, de notre métier, de nos vies même.",
(-6) :"C'est dans cette constance que réside la vraie grandeur.
N'oublions pas les mots inspirants d'Aristote, soulignant que \"nous sommes ce que nous faisons de manière répétée. L'excellence, alors, n'est pas un acte, mais une habitude.\"",
(-7) : "Le travail assidu, cette habitude de persévérer même quand les défis semblent insurmontables, est le trait distinctif des esprits qui forgent des destins remarquables.",
(-8) : "En ces temps où les vents du changement soufflent avec force, où l'incertitude peut sembler omniprésente, rappelez-vous les paroles de Marx : ",
(-9):"\"Les philosophes n'ont fait qu'interpréter le monde de différentes manières, ce qui importe, c'est de le changer.\" C'est par notre travail,",
(-10) : "notre dévouement et notre engagement envers l'excellence que nous façonnons ce monde pour le mieux.
Ainsi, puisses tu te rappeler toujours que le travail assidu n'est pas seulement un devoir," ,
(-11) : "mais une voie vers la grandeur. C'est par nos efforts constants que nous écrivons l'histoire, que nous laissons notre empreinte dans le sable du temps.",
(-12): "Je suis si déçu.",
(-13): "Tu sais, des fois, je me demande comment tu réfléchis et comment tu es arrivé là.",
(-14): "Tu me semblais bien dans tes bottes, avoir un esprit critique, capable de faire la différence entre rêve et réalité!",
(-15): "Puis tu me réponds ça. Et je t'avoue, que je remet en question la santé de tes processus réflexif et ta logique.",
(-16) : "As-tu eu des cours de logique? Sais-tu ce qu'est l'absurde? Ou même sais tu lorsque quelque chose n'est pas faisable ou faux?",
(-17): "Peut être, peut être pas, je ne sais plus que penser... Tu sais que ces textes sont trèss vieux?",
(-18) : "Et que la façon d'écrire n'est pas héréditaire? Et que on a vraiment aucune chance de retrouver les descendant?",
(-19): "Mais peut être que ton attitude relève du génie.",
(-20) : "Peut être que tu seras le nouveau cerveau de notre époque. Peut être découvriras-tu un moyen de remonter aux descendants par l'écriture.",
(-21) : "Mais je t'avoue avoir quelques doutes.",
(-22) : "Je suis consterné.",
(-23) : "Je vois, cela peut être une hypothèse intéressante effectivement. Ouvre le coffre pour voir si c'est le même cas pour les autres lettres.",
(-24) : "Interloqué.e, tu lui répond : \"Mais, je n'ai pas le code de votre coffre.\"",
(-25): "Silence. Étienne Bazeries réfléchit, essaye quelques combinaisons sur le coffre mais rien n'y fait.",
(-26) : "\"Aaaaargh\", dit-il. \"Bon, il va falloir retrouver le code. Je ne pensais pas que j'allais oublier cette combinaison...\" ",
(-27) : "\"J'ai noté le code du coffre sur ce papier avec du jus de citron mais nous n'avons pas de flammes ici pour révéler le contenu de l'écriture.\" Il te tend un papier. Tu le range dans ta poche.",
(-28): "Les livres se sont ouverts, révélant un verre avec une drôle de substance rouge à l'intérieur.",
(-29): "Je me saisis du verre, il pourrait me servir.",
(-30) : "Une flamme s'alluma dans l'entre de la machine. Il fallait à présent que j'en approche mon bout de papier pour obtenir le code! Je plaçais le papier devant la machine.",
(-31) : "Nous attendîmes tous les deux plusieurs minutes, puis, alors que nous perdions espoir, des chiffres commencèrent à se dessiner.",
(-32) : "330 309! Voilà le code du coffre! Nous nous précipitèrent vers celui-ci afin d'en découvrir le contenu.",
(-33) : "Plusieurs lettres illisibles étaient enfermées à l'intérieur. Puis plusieurs heures passèrent. Nous chercions désespéremment un moyen de les décoder, sans succès...",
(-34) :"Puis, Étienne dit : \" Et si cette suite 124-22-125-46-345  correspondait à \"les ennemis\"? Après tout, cette cryptographie était utilisée pour les conversations secrètes et donc les conversations en temps de guerre. Essaye de voir si ça pourrait être une solution pour ce texte.\"",
(-35) : "Bravo, tu as réussi à déchiffrer le texte !!! Voyons voir ce qu'il est dit.",
(-36) : "Hummm, on dirait bien que c'était une lettre envoyée en temps de guerre! Il nous faudrait déterminer plus précisément à quelle date elle a été envoyée! Mais cela sera le travail des historiens.",
(-37) : "Nous avons continué à déchiffrer des messages jusque tard dans la nuit.",
(-38) : "Sans même le remarquer, nous nous sommes tous deux assoupis.",
(-39) : "Un bruit fini par me sortir de mon sommeil, et mon accolyte était parti, il était certainement rentré chez lui.",
(-40) : "Hummm, est-ce un poignard ou un coupe papier pour ouvrir les lettres? Cela me servira peut être...",
(-41) : "Tiens, on dirait que les deux pages suivantes sont collées...", 
(-42) : "Tiens, l'homme au masque de fer à nouveau... Attendez une minute, qu'est ce que c'est que ce message?!", 
(-43): "On dirait un chiffrement par le Grand Chiffre! Je vais essayer de le déchiffrer avec les associations nombres-lettres que j'ai déjà obtenu.",
(-44): "Alors, l'homme au Masque de Fer pourrait être ce \"Général Bulonde\"? il faudra que j'en parle à Étienne quand il reviendra, je suis persuadé que ça le fascinera!",
(-45) : "Et ces coordonnées, qu'en penser? Il est vrai que la forteresse de Pignerol est juste à côté, je vais aller y faire un tour.",
(-46) : "Je me suis donc dirigé vers la forteresse. La nuit était froide, mais ce n'était pas déplaisant, cela donnait la sensation de partir en aventure tout en étant reposant. Ce qui n'est pas vraient ce à quoi j'ai été accoutumé ces derniers jours.",
(-47) : "J'arrivais avec ma pelle devant la forteresse, elle est vraiment majestueuse. Je ne savais pas exactement d'où est ce qu'il fallait que je parte pour suivre les instructions. J'ai supposé que c'était de l'entrée principale.",
(-48): "Je finis par arriver dans une forêt. Le chemin ne semblait pas être beaucoup emprunté, il y avait beaucoup de broussailles, mais j'approchais du but!",
(-49): "Une fois arrivé, l'endroit n'avais rien de spécial. Je me mis alors à creuser, après tout, ce message datait, il était possible que ce que je cherchais ait fini sous terre. Ou bien qu'il n'y ait rien du tout.",
(-50): "Il faisait si sombre qu'au départ je ne distinguais rien au fond de mon trou, puis je vis une lueur.",
(-51): "en me rapprochant, je pu distinguer ce qui semblait être un vieux masque ou casque en fer. Serais-je arrivé à mon but? Je décidais de le sortir du trou.",
(-52): "C'était effectivement un masque, mais qu'elle etait cette inscription? ",
(-53): "...... Le 19ème siècle?.....",
(-54): "Une lumière m'éblouit alors, où est-ce qu'on va encore m'envoyer?!!!"
}
# permet d'afficher simplement les dialogues
func dialogue(numero):
	$text.text = dialogues[numero];