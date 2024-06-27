extends CanvasLayer

var dialogues ={
	0 : "Ma tête est lourde, si lourde... Mais quel est ce bruit ? \n Je devrais peut-être regarder dans l'arène ce qu'il se passe...",
	1 : "Qu'est-ce que..? Où suis-je ?",
	2 : "Pssst ! Viens par ici, je connais un moyen de sortir",
	3 : "test"
}

var dialogues_arene = {
	0: "Je m'appelle Titus et je suis un espion de César.",
	1: "Je m'infiltre dans les soirées clandestines des groupes qui souhaitent la mort de Jules César afin de récolter des informations
	\tet les communiquer à César et ses généraux par des messages chiffrés.",
	2: "Pour chiffrer et déchiffrer les messages, nous utilisons la méthode de César. Si tu souhaites en savoir davantage sur cette méthode,
	\t clique sur le point d'interrogation, sinon passe à la suite.",
	3: "César a beaucoup entendu parlé de toi et de tes talents de déchiffrage. Il souhaite te confier une mission de la plus haute importance.
	\tMais avant, je dois te tester. Peux-tu me déchiffrer ce message que j'ai reçu ce matin ?",
	4: "Bravo tu as réussi à déchiffrer le message !
	\tJ'entends du bruit... les gladiateurs te cherchent, sortons d'ici !"
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

