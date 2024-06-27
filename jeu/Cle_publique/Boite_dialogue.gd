extends CanvasLayer

# On stocke ici les dialogues
var dialogues ={
	0 : "Et ça recommence..",
	1 : "Qu'est-ce que ça va être cette fois-ci ?",
}
# Called when the node enters the scene tree for the first time.
func dialogue(numero):
	$text.text = dialogues[numero];
