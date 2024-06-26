extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var dialogues = {
	[0,0] : "Maintenant essaie d'envoyer un message non chiffré à Bob et de le lire.",
	[1,0] : "Bien, mais maintenant tu peux observer que Eve aussi peut le lire.",
	[2,0] : "Pour empêcher ça, il faut que tu chiffres le message. Envoie un message chiffré à Bob, puis déchiffre-le.",
	[3,0] : "Voilà, Bob peut le lire. Tu peux vérifier que Eve, elle, ne le peut pas.",
	[4,0] : "Voilà, Eve ne peut rien faire car elle n'a pas accès à la clé privée. Je pense que tu as compris.",
	[4,1] : "Tu peux continuer d'utiliser l'ordinateur, ferme la fenêtre quand tu as fini.",
	[5,0] : "C'est fini"
}

func dialogue(numero):
	$text.text = dialogues[numero]

var current_state = 0
var current_text = 0

func incr_dialogue():
	if(dialogues.has([current_state, current_text + 1])):
		dialogue([current_state, current_text + 1])
		current_text += 1
		return false
	else:
		current_state += 1
		current_text = 0
		if(dialogues.has([current_state, 0])):
			dialogue([current_state, 0])
		return true
