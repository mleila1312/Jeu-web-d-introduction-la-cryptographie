extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TransitionScreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_sortie_pressed():
	var t = $TextEdit.text
# Plusieurs réponses autorisées, indépendant de la casse
	if(t.to_upper() in ["SULMONA", "LE SULMONA", "SULMONA ", "AU SULMONA"]):
		$TransitionScreen.show()
		$TransitionScreen.transition()
		hide()
		get_node("../bureau/coffre_ouvert").hide()
		get_node("../bureau/coffre_ferme").show()
	elif(t == "fd"):
		get_node("../interaction").entrer()
	else:
		hide()

func _on_transition_screen_transitioned():
	get_node("../bureau").hide()
	get_node("../dialogue").entrer()


func _on_transition_screen_finished():
	$TransitionScreen.hide()
