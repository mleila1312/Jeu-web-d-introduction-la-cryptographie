extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$bg_resto.hide()
	$sortie_resto.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


var state_coffre = 0;
func _on_bouton_coffre_pressed():
	match state_coffre:
		0:
			get_node("../bg_Image").change_bg("Bureau découvert.png");
			state_coffre += 1;
		1:
			get_node("../bg_Image").change_bg("Bureau ouvert.png");
			state_coffre += 1;
		_:
			get_node("../feuille").show();


func _on_bouton_fenetre_pressed():
	$bg_resto.show()
	$sortie_resto.show()


func _on_sortie_resto_pressed():
	$bg_resto.hide()
	$sortie_resto.hide()
