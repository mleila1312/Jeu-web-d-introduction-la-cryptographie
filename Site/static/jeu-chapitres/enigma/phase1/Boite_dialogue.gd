extends CanvasLayer

var dialogues ={
	0 : "Tiens ? Un post-it.",
	1 : "Ca pourra servir plus tard.",
	2 : "Bravo, vous avez réussi le test. Si vous parvenez à trouver votre chemin dans ce bâtiment, vous serez recruté. Nous cherchons les meilleurs. Bon courage, vous touchez au but.",
	3 : "Félicitations, recrue. Bienvenue à Bletchley Park. Il vous attend.",
	4 : "Bonjour. Allez, mets-toi au travail.",
	5 : "Comment ça ? Je viens d'arriver, je ne sais même pas ce que je suis censé faire !",
	6 : "Bon, on dirait que je vais devoir faire des explications... Accroche-toi.",
	7 : "La machine qui se trouve devant toi est Enigma. C'est une machine concue par les Allemands qui leur permet de chiffrer leurs communications.",
	8 : "Nous, les meilleurs mathématiciens britanniques, tentons de \"casser\" Enigma, c'est-à-dire de trouver un moyen de déchiffrer les communications allemandes.",
	9 : "Pour cela, nous sommes en train de construire une bombe !",
	10 : "UNE BOMBE !? Ces mathématiciens sont fous, je dois m'enfuir d'ici.",
	11 : "Pas des bombes qui explosent. C'est comme ça que nous appelons la machine censée casser Enigma. Dans le passé, elles ont permi de casser une version moins complexe d'Enigma.",
	12 : "Tiens, regarde devant toi. Je vais t'expliquer comment fonctionne Enigma."
	
}

func dialogue(numero):
	$text.text = dialogues[numero];

