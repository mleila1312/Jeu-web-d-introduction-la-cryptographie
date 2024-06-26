extends CanvasLayer

var dialogues ={
	0 : "Ma tête est lourde, si lourde... Oh doux sommeil, pourquoi me quitte tu si tôt!",
	1 : "Qu'est-ce que..? Qui me tape sur la tête? Qui est-ce?",
	2: "L'homme s'exprime alors : \"Qu'est-ce que tu fais la à t'assoupir, nous avons un travail dantesque à accomplir.\"",
	3 : "Tu devais réfléchir à des stratégies pour décrypter les textes mais on dirait que tu as préféré passer une bonne nuit. Bon, sur quoi as-tu travaillé durant ma semaine d'absence?",
	4 : "Euuuuuuh, alors...." 
}
# Called when the node enters the scene tree for the first time.
func dialogue(numero):
	$text.text = dialogues[numero];
