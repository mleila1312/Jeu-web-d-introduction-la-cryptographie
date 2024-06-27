extends CanvasLayer

var dialogues ={
	5 : "Trouve le bouton rouge !",
	6 : "Non ça c'est bleu",
	7 : "Non ça c'est noir",
	8 : "T'es con ou quoi ?",
	9 : "Enfin !"
}
# Called when the node enters the scene tree for the first time.
func dialogue(numero):
	$text.text = dialogues[numero];
