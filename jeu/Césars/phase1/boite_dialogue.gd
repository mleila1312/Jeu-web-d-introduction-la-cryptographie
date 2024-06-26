extends CanvasLayer

var dialogues ={
	0 : "Ma tête est lourde, si lourde... Mais quel est ce bruit ? \n Je devrais peut-être regarder dans l'arène ce qu'il se passe...",
	1 : "Qu'est-ce que..? Où suis-je ?",
	2 : "Pssst ! Viens par ici, je connais un moyen de sortir",
	3 : "text",
	4 : "Euuuuuuh, alors...." 
}

var dialogues_arene = {
	0: "Je m'appelle Titus et je suis un espion de César.",
	1: "Je m'infiltre dans les soirées clandestines des groupes qui souhaitent la mort de Jules César afin de récolter des informations
	\tet les communiquer à César et ses généraux par des messages chiffrés.",
	2: "César a beaucoup entendu parlé de toi et de tes talents de déchiffrage. Il souhaite te confier une mission de la plus haute importance.
	\tMais avant, il faut qu'on sorte d'ici. Je connais un raccourci, suis-moi !",
}

# Called when the node enters the scene tree for the first time.
func dialogue(numero):
	if $text != null:
		$text.text = dialogues[numero];
	else:
		print("Error: $text is null.");

func dialogue_arene(numero):
	if $text != null:
		$text.text = dialogues_arene[numero];
	else:
		print("Error: $text is null.");

