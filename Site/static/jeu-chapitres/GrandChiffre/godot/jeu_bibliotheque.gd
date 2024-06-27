extends Node2D

#si on décide de partir du mini jeu bibliothèque post premier déchiffrement
signal goback(finished)
#indique si le jeu est fini
var end_game=false;
#indique les places des llivres à l'instant t=0
var places = [1,2,3,4,5,6,7,8];
#indique le premier livre sélectionné
var first=-1;
#etat du jeu à l'instant t par rapport aux dialogues
var state_bibli = 0;
#indique si le poignard a déjà été trouvé
var poignard_found=false
#indique si on est dans une phase après le premier chiffrement
var post_decrypt=false

#contient les textes possibles pour la page 1 des livres en post decrypt, ie les titres des livres
var page1_txt={
	1: "Les merveilles de l'alchimie!", 
	2 : "La bourse en 3 étapes", 
	3 : "La cuisine chez vous",
	4 : "Le Manuel de Bonne Conduite",
	5 : "Justine, Marquis de Sade",
	6 : "Les Grandes Découvertes de la Science Naturelle",
	7 : "Princesse de Clève",
	8 : "Les prisonniers méconnus"
};

# contient les textes possibles pour la page 2 des livres en post decrypt, ie les résumés des livres/pages de garde
var page2_txt={
	1 : "Bienvenue, jeunes explorateurs, dans le monde fascinant et mystérieux de l'alchimie ! Préparez-vous à découvrir une aventure incroyable où la science rencontre la magie, et où chaque expérience est une porte ouverte vers des secrets anciens et des merveilles cachées.

Imaginez que vous êtes un apprenti sorcier dans un vieux laboratoire rempli de livres poussiéreux, de potions pétillantes et d'étranges symboles gravés dans des manuscrits anciens. C'est ici que commence votre voyage dans l'alchimie, une discipline vieille de plusieurs siècles qui a captivé les esprits curieux comme le vôtre.

L'alchimie, c'est un peu comme une chasse au trésor pour les scientifiques en herbe. Les alchimistes d'autrefois cherchaient la pierre philosophale, une substance légendaire capable de transformer les métaux ordinaires en or et de donner la vie éternelle. Mais l'alchimie, c'est bien plus que cela ! C'est aussi une quête pour comprendre les secrets de la nature et les mystères de l'univers.", 
2 : "Chers lecteurs, nous sommes heureux de vous présenter ce merveilleux ouvrage qui a été le fruit de longues années de recherche.

Nous sommes à une période où le commerce et la finance connaissent une évolution spectaculaire. Les grandes places boursières d'Amsterdam, Londres et Paris se développent, attirant des marchands, des banquiers et des aventuriers de toutes les contrées. Dans ce contexte d'effervescence économique et de découvertes incessantes, \"La Bourse en 3 Étapes\" émerge comme un phare pour ceux qui cherchent à naviguer avec sagesse dans les eaux souvent tumultueuses des premiers marchés financiers.

Prenez en mains vos finances et apprenez ce qu'est la bourse, elle n'est pas réservée aux autres, elle peut vous profiter aussi à vous! Bien évidemment, pour en tirer des gains, il faut être bien informé et connaître du monde, nous détaillerons tout cela dans le chapitre 3. Nous aborderons tout d'abord des notions de bases de mathématiques et de statistiques vous permettant d'estimer les risques de placement, puis nous discuterons de la réputation des entreprises déjà sur le marché!", 
3: "Bienvenue dans \"La Cuisine Chez Vous\", un guide culinaire conçu pour transformer votre maison en un véritable havre de délices gastronomiques. Que vous soyez un novice en cuisine ou un chef amateur en quête de nouvelles inspirations, ce livre est votre compagnon idéal pour explorer l'art de la cuisine maison.

La cuisine est bien plus qu'une simple tâche domestique. C'est un acte d'amour, un moyen d'expression, et une source infinie de plaisir et de créativité. C'est autour d'un bon repas que se créent les souvenirs les plus précieux, que se forgent les liens familiaux et amicaux, et que s'exprime la diversité culturelle.

Dans \"La Cuisine Chez Vous\", nous avons rassemblé une collection de recettes variées, allant des plats traditionnels aux innovations contemporaines. Chaque recette est conçue pour être accessible et réalisable, utilisant des ingrédients que l'on peut trouver facilement et des techniques simples à maîtriser. Notre objectif est de vous montrer que la cuisine maison peut être à la fois délicieuse et sans stress, tout en apportant une touche de raffinement et de plaisir à votre table.",
4 : "Cher lecteur,

C'est avec un profond respect pour les traditions et les valeurs de notre temps que nous vous présentons \"Le Manuel de Bonne Conduite\". Cet ouvrage se veut un guide essentiel pour tous ceux qui aspirent à mener une vie exemplaire, marquée par la vertu, l'honneur et la bienséance.

Nous vivons une époque de grandeur et de transformation, où les codes de conduite et les normes sociales jouent un rôle crucial dans la structuration de notre société. Les cours royales, les salons littéraires et les assemblées publiques sont des lieux où l'élégance, la courtoisie et la sagesse sont hautement valorisées. \"Le Manuel de Bonne Conduite\" a été conçu pour vous aider à naviguer avec grâce et distinction à travers ces cercles exigeants.

L'auteur de ce traité, bien qu'anonyme, s'exprime avec la sagesse d'un observateur avisé et l'expérience d'un homme de grande vertu. Ses conseils transcendent les simples règles de comportement pour toucher les principes universels de l'humanité.

En vous plongeant dans ce manuel, vous vous engagez dans une quête d'excellence personnelle et sociale. Vous découvrirez les clés pour vivre avec dignité et honneur, et pour inspirer respect et admiration autour de vous.

Que \"Le Manuel de Bonne Conduite\" soit votre guide dans cette noble entreprise, et qu'il vous aide à incarner les idéaux les plus élevés de notre siècle. Puisse votre conduite exemplaire être une lumière pour ceux qui vous entourent, et puisse votre vie être riche en respect, en sagesse et en bonheur.",
5 : "Ce fut au couvent de Panthemont que Justine et moi fûmes élevées. Vous connaissez la célébrité de cette abbaye, et vous savez que c'était de son sein que sortaient depuis bien des années les femmes les plus jolies et les plus libertines de Paris. Euphrosine, cette jeune personne dont je voulus suivre les traces, qui, logée dans le voisinage de mes parents, s'était évadée de la maison paternelle pour se jeter dans le libertinage, avait été ma compagne dans ce couvent ; et comme c'est d'elle et d'une religieuse de ses amies que j'avais reçu les premiers principes de cette morale qu'on est surpris de me voir, aussi jeune, dans les récits que vient de vous faire ma sœur, je dois, ce me semble, avant tout, vous entretenir de l'une et de l'autre... vous rendre un compte exact de ces premiers instants de ma vie où, séduite, corrompue par ces deux sirènes, le germe de tous les vices naquit au fond de mon cœur.
La religieuse dont il s'agit s'appelait Mme Delbène ; elle était abbesse de la maison depuis cinq ans, et atteignait sa trentième année, lorsque je fis connaissance avec elle. Il était impossible d'être plus jolie : faite à peindre, une physionomie douce et céleste, blonde, de grands yeux bleus pleins du plus tendre intérêt, et la taille des Grâces. Victime de l'ambition, la jeune Delbène avait été mise à douze ans dans un cloître, afin de rendre plus riche un frère aîné qu'elle détestait. Enfermée dans l'âge où les passions commencent à s'exprimer, quoique Delbène n'eût encore fait aucun choix, aimant le monde et les hommes en général, ce n'avait pas été sans s'immoler elle-même, sans triompher des plus rudes combats, qu'elle s'était enfin déterminée à l'obéissance. Très avancée pour son âge, ayant lu tous les philosophes, ayant prodigieusement réfléchi, Delbène, en se condamnant à la retraite, s'était ménagé deux ou trois amies. On venait la voir, on la consolait ; et comme elle était fort riche, l'on continuait de lui fournir tous les livres et toutes les douceurs qu'elle pouvait désirer, même celles qui devaient le plus allumer une imagination... déjà fort vive, et que n'attiédissait pas la retraite.
Pour Euphrosine, elle avait quinze ans lorsque je me liai avec elle ; et elle était depuis dix-huit mois l'élève de Mme Delbène, lorsque l'une et l'autre me proposèrent d'entrer dans leur société, le jour où je venais d'entrer dans ma treizième année. Euphrosine était brune, grande pour son âge, fort mince, de très jolis yeux, beaucoup d'esprit et de vivacité, mais moins jolie, bien moins intéressante que notre supérieure.",
6 : "Bienvenue, cher lecteur, dans \"Les Grandes Découvertes de la Science Naturelle\", un voyage captivant à travers les siècles, où vous découvrirez les figures emblématiques et les moments décisifs qui ont façonné notre compréhension du monde naturel. Ce roman vous plonge au cœur des aventures scientifiques, des explorations audacieuses et des révélations qui ont transformé notre vision de la vie sur Terre.

La science naturelle, vaste et fascinante, englobe l’étude de la biologie, de la géologie, de la botanique, de la zoologie et bien plus encore. Chaque découverte dans ces domaines a été une pierre angulaire, permettant à l’humanité de déchiffrer les mystères de la nature, d'améliorer notre qualité de vie et d'apprécier la complexité de notre planète.

\"Les Grandes Découvertes de la Science Naturelle\" n'est pas seulement une chronologie des faits et des figures, mais une célébration de la curiosité humaine et de la quête incessante de connaissance. À travers les récits de ces scientifiques passionnés, vous serez transporté dans les laboratoires, les expéditions, et les moments de révélation qui ont marqué l'histoire de la science.

Que vous soyez un amateur de science, un étudiant en quête de connaissances, ou simplement curieux de comprendre comment nous en sommes arrivés à connaître notre monde naturel, ce roman vous offre une perspective riche et immersive. Embarquez avec nous dans cette aventure scientifique, et laissez-vous inspirer par les esprits brillants qui ont illuminé notre chemin vers la compréhension de la nature.

Bonne lecture, et que votre voyage à travers les grandes découvertes de la science naturelle soit aussi édifiant que fascinant.",

7 : "La magnificence et la galanterie n’ont jamais paru en France avec tant d’éclat que dans les dernières années du règne de Henri second. Ce prince était galant, bien fait et amoureux; quoique sa passion pour Diane de Poitiers, duchesse de Valentinois, eût commencé il y avait plus de vingt ans, elle n’en était pas moins violente, et il n’en donnait pas des témoignages moins éclatants.

Comme il réussissait admirablement dans tous les exercices du corps, il en faisait une de ses plus grandes occupations. C’étaient tous les jours des parties de chasse et de paume, des ballets, des courses de bagues, ou de semblables divertissements; les couleurs et les chiffres de madame de Valentinois paraissaient partout, et elle paraissait elle-même avec tous les ajustements que pouvait avoir mademoiselle de La Marck, sa petite-fille, qui était alors à marier. La présence de la reine autorisait la sienne. Cette princesse était belle, quoiqu’elle eût passé la première jeunesse; elle aimait la grandeur, la magnificence et les plaisirs. Le roi l’avait épousée lorsqu’il était encore duc d’Orléans, et qu’il avait pour aîné le dauphin, qui mourut à Tournon, prince que sa naissance et ses grandes qualités destinaient à remplir dignement la place du roi François premier, son père.

L’humeur ambitieuse de la reine lui faisait trouver une grande douceur à régner; il semblait qu’elle souffrît sans peine l’attachement du roi pour la duchesse de Valentinois, et elle n’en témoignait aucune jalousie; mais elle avait une si profonde dissimulation, qu’il était difficile de juger de ses sentiments, et la politique l’obligeait d’approcher cette duchesse de sa personne, afin d’en approcher aussi le roi. Ce prince aimait le commerce des femmes, même de celles dont il n’était pas amoureux: il demeurait tous les jours chez la reine à l’heure du cercle, où tout ce qu’il y avait de plus beau et de mieux fait, de l’un et de l’autre sexe, ne manquait pas de se trouver. Jamais cour n’a eu tant de belles personnes et d’hommes admirablement bien faits; et il semblait que la nature eût pris plaisir à placer ce qu’elle donne de plus beau, dans les plus grandes princesses et dans les plus grands princes. Madame Élisabeth de France, qui fut depuis reine d’Espagne, commençait à faire paraître un esprit surprenant et cette incomparable beauté qui lui a été si funeste. Marie Stuart, reine d’Écosse, qui venait d’épouser monsieur le dauphin, et qu’on appelait la reine Dauphine, était une personne parfaite pour l’esprit et pour le corps: elle avait été élevée à la cour de France, elle en avait pris toute la politesse, et elle était née avec tant de dispositions pour toutes les belles choses, que, malgré sa grande jeunesse, elle les aimait et s’y connaissait mieux que personne. La reine, sa belle-mère, et Madame, sœur du roi, aimaient aussi les vers, la comédie et la musique. Le goût que le roi François premier avait eu pour la poésie et pour les lettres régnait encore en France; et le roi son fils aimant les exercices du corps, tous les plaisirs étaient à la cour. Mais ce qui rendait cette cour belle et majestueuse était le nombre infini de princes et de grands seigneurs d’un mérite extraordinaire. Ceux que je vais nommer étaient, en des manières différentes, l’ornement et l’admiration de leur siècle.",

8 : "Bienvenue, cher lecteur, dans les pages poignantes de \"Les Prisonniers Méconnus\", un récit qui vous dévoilera les histoires oubliées des captifs de l'histoire et leurs mystères.

Les prisons, ces bastions de silence et de mystère, recèlent les récits les plus énigmatiques de l'humanité. Parmi eux, l'homme au masque de fer demeure l'un des personnages les plus énigmatiques de tous les temps. Son visage dissimulé derrière un masque de fer impénétrable, il est resté anonyme à travers les siècles, malgré les nombreuses théories qui tentent d'expliquer son identité et sa raison d'être emprisonné.

Une des théories les plus intrigantes suggère qu'il aurait été le jumeau secret du Roi, maintenu captif pour éviter toute contestation du trône. Cette énigme historique a captivé des générations de chercheurs et d'amateurs d'histoire, tous cherchant à percer le mystère de son existence et à découvrir la vérité derrière son masque.

Dans \"Les Prisonniers Méconnus\", nous nous sommes engagés à rassembler tous les indices disponibles qui pourraient éclairer cette obscurité historique. Nous explorons non seulement les récits fascinants de l'homme au masque de fer, mais également d'autres captifs anonymes dont les histoires méritent d'être révélées.
"
};

#indique si le joueur a fini la phase de jeu après le premier déchiffrement
signal fin_fouille2;

#affiche les livres et la scène lorsque le premier déchiffrement à déjà été fait
func post_decrypt_books(poignard):
	$background.texture= load("res://images/etagere_vide.png");
	poignard_found=poignard;
	post_decrypt=true;
	$background.show();
	$retour.show();
	$page1.hide();
	$page2.hide();
	$ferme_livre.hide();
	$poignard_button.hide();
	for i in range(1, 9) : 
		get_node("book"+str(i)).show();
	
#échange les places de deux livres
func exchange_place(i, j):
	var first_book = get_node("book"+str(i));
	var second_book = get_node("book"+str(j));
	var x_tmp= first_book.position.x;
	first_book.position.x= second_book.position.x;
	second_book.position.x =x_tmp;
	var p1 = places[i-1];
	places[i-1]=places[j-1];
	places[j-1]=p1;

#initialise la scène lors de la première arrivée dans la bibliothèque(ie la phase avec les pieces)
func init_game():
	exchange_place(1, 3);
	exchange_place(5, 8);
	exchange_place(6, 2);
	exchange_place(4, 8);
	print(places)
	$background.show();
	$retour.show();
	$page1.hide();
	$page2.hide();
	$ferme_livre.hide();
	$poignard_button.hide();
	for i in range(1, 9) : 
		get_node("book"+str(i)).show();

#affiche le mini jeu lorsque le jeu a déjà été résolu
func load_finished_game() :
	$background.texture= load("res://images/etagere_ouverture_vide.png");
	$retour.show();
	$background.show();
	$page1.hide();
	$page2.hide();
	for i in range(1, 9) : 
		get_node("book"+str(i)).hide();

#si le jeu est fini
func finished ():
	end_game=true;
	state_bibli=1;
	$background.texture= load("res://images/etagere_ouverture_verre.png");
	for i in range(1, 9) : 
		get_node("book"+str(i)).hide();
	
#vérifie si le jeu est fini
func check_finished():
	print(places)
	if places==[1,2,3,4,5,6,7,8] : 
		finished();
	
#si on clique sur un livre
func on_book_pressed(id):
	if not post_decrypt: 
		#si on est dans la première visite de la bibliothèque
		if first == -1 : 
			var book = get_node("book"+str(id));
			book.position.y -=150;
			first=id
		elif first == id : 
			var book = get_node("book"+str(id));
			book.position.y +=150;
			first = -1;
		else : 
			var book1 = get_node("book"+str(first));
			book1.position.y+=150;
			exchange_place(first, id);
			first = -1;
			check_finished();
	else : 
		#si on est après le 1er déchiffrement
		var boite_dialogue= get_parent().get_parent().get_parent().get_parent().get_node("Boite_dialogue");
		if id==8 and poignard_found : 
			boite_dialogue.show();
			boite_dialogue.dialogue(-41)
			state_bibli=5;
		elif id==8 : 
			state_bibli=4
			boite_dialogue.show();
			boite_dialogue.dialogue(-41)
		else : 
			boite_dialogue.hide();
			$ferme_livre.show();
			state_bibli=0
		$background.texture= load("res://images/open_book.png");
		for i in range(1, 9) : 
			get_node("book"+str(i)).hide();
		$page1.text=page1_txt[id];
		$page2.text=page2_txt[id];
		$retour.hide()
		$page1.show();
		$page2.show();

#si on souhaite partir de la bibliothèque
func _on_button_pressed():
	emit_signal("goback", end_game)

#gère les dialogues
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		var boite_dialogue= get_parent().get_parent().get_parent().get_parent().get_node("Boite_dialogue");
		if state_bibli==1: 
			boite_dialogue.show();
			boite_dialogue.dialogue(-27-state_bibli)
			state_bibli+=1;
		elif state_bibli==2: 
			boite_dialogue.dialogue(-27-state_bibli)
			state_bibli+=1;
		elif state_bibli== 3: 
			print("jeubibli")
			boite_dialogue.hide();
			$background.texture= load("res://images/etagere_ouverture_vide.png");
			state_bibli=0
		elif state_bibli==4 : 
			boite_dialogue.hide();
			$ferme_livre.show();
			state_bibli=0
		elif state_bibli==5 : 
			boite_dialogue.hide();
			$poignard_button.show();
			$ferme_livre.show();
			state_bibli=0

# dans la phase après le premier déchiffrement, si l'on souhaite fermer un livre qu'on a ouvert
func _on_ferme_livre_pressed():
	$background.texture= load("res://images/etagere_vide.png");
	$retour.show();
	$page1.hide();
	$page2.hide();
	$ferme_livre.hide();
	$poignard_button.hide();
	$retour.show()
	for i in range(1, 9) : 
		get_node("book"+str(i)).show();

#si on a trouvé le poignard
func _on_poignard_button_pressed():
	fin_fouille2.emit();
