extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# 3 choses importantes :
# - Les clés sont des couples (etat, avancement) pour faciliter le code des dialogues. 
# - On a d'abord un booléen pour dire si c'est Ron Rivest qui parle, afin de pouvoir afficher sa miniature
# - La fonction incr_dialogue avance dans l'ordre des dialogues, et renvoie true si on change d'état

var dialogues = {
	[0,0] : [true, "Vous voilà ! Bonjour. J'ai vu votre message dans mon coffre."],
	[0,1] : [false, "Euh bonjour, qui êtes-vous ?"],
	[0,2] : [true, "Je suis Ron Rivest, c'est dans mon bureau que tu as posé l'adresse de ce restaurant."],
	[0,3] : [true, "On m'a dit qu'il fallait que je t'explique le principe de la cryptographie asymétrique."],
	[0,4] : [false, "Oui, c'est cela."],
	[0,5] : [true, "Bien. En fait le principe est le même que celui que tu as utilisé pour me retrouver ici."],
	[0,6] : [false, "...c'est-à-dire ?"],
	[0,7] : [true, "Après que tu aies déposé ton message dans mon coffre, il s'est fermé tout seul. N'importe qui aurait pu le fermer. Mais seul moi peut l'ouvrir."],
	[0,8] : [true, "Le principe est le suivant : n'importe qui peut chiffrer un message en utilisant une clé publique, mais seul le destinataire du message peut le déchiffrer. J'ai un petit schéma pour t'aider à comprendre."], 
	[1,0] : [true, "Le voici."],
	[1,1] : [true, "Disons qu'Alice veut envoyer un message sécurisé à Bob, et que Eve veut intercepter ce message."],
	[1,2] : [true, "Pour cela, Bob distribue, publiquement, une clé publique. Cette clé permet de chiffrer le message."],
	[1,3] : [true, "Mais, en générant sa clé publique, Bob a également généré une clé privée qui permet de déchiffrer les messages chiffrés par la clé publique. Comme ça, il peut déchiffrer tous les messages, mais personne d'autre ne le peut."],
	[1,4] : [true, "Si jamais Eve s'empare d'un message, elle ne pourra pas le déchiffrer."],
	[1,5] : [true, "C'est le principe de cryptographie asymétrique."],
	[1,6] : [false, "Mais comment crée-t-on ces paires de clés ?"],
	[1,7] : [true, "Une méthode de cryptographie asymétrique est le RSA. Je suis à l'origine du R dans le nom."],
	[1,8] : [true, "Pour le RSA, la clé privée est une paire de très grands nombres premiers, et la clé publique est leur produit. On fait ensuite des opérations sur notre message avec cette clé."],
	[1,9] : [true, "Ces couples de clés sont sécurisés car les ordinateurs sont trop lents pour pouvoir factoriser en un temps raisonnable."],
	[1,10] : [true, "Mais pour bien comprendre, il faut y mettre les mains. Reviens dans mon bureau, je vais te donner une simulation sur mon ordinateur dans laquelle tu pourras faire ces échanges de messages."]
}

func has_tete(numero):
	return dialogues[numero][0]

func dialogue(numero):
	$text.text = (dialogues[numero])[1]

var current_state = 0
var current_text = 0

var renvoi = false

func incr_dialogue():
	if(dialogues.has([current_state, current_text + 1])):
		dialogue([current_state, current_text + 1])
		current_text += 1
		renvoi = false
	else:
		current_state += 1
		current_text = 0
		if(dialogues.has([current_state, 0])):
			dialogue([current_state, 0])
		renvoi = true
	if(dialogues.has([current_state, current_text])):
		if(has_tete([current_state, current_text])):
			print("tete")
			$tete.show()
		else:
			print("pas tete")
			$tete.hide()
	return renvoi
