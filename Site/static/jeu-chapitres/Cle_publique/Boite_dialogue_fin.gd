extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var dialogues = {
	[0,0] : "Bien, montrez-moi votre code maintenant. Je devrais le comprendre.",
	[0,1] : "Oui j'imagine que c'est un code lié au RSA. C'est sûrement un produit de nombre premier. Je vais vous le décoder.",
	[1,1] : "C'est bien cela, on a 38819813 = 5849×	6637. J'imagine que votre code est composé de ces deux nombres.",
	[1,2] : "J'ai pu le décoder sans problème car ces nombres sont petits. Mais en général, pour le RSA, on utilise des nombres bien plus grands, comme 114381625757888867669235779976146612010218296721242362562561842935706935245733897830597123563958705058989075147599290026879543541.",
	[1,2] : "Et bien... bon voyage !"
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
