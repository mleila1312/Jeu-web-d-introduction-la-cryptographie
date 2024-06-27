extends Node2D

# On cache tout ce qui n'est pas important au début
func _ready():
	$bg_resto.hide()
	$sortie_resto.hide()
	$coffre_ouvert.hide()
	$coffre_ferme.show()

# Fonction obligatoire
func _process(_delta):
	pass

# Conserve l'état du coffre : 0 = fermé, 1 = ouvert

var state_coffre = 0;
func _on_bouton_coffre_pressed():
	match state_coffre:
		0:
			$coffre_ferme.hide()
			$coffre_ouvert.show()
			state_coffre += 1;
		_:
			get_node("../feuille").show();


func _on_bouton_fenetre_pressed():
	$bg_resto.show()
	$RestoMini.hide()
	if(state_coffre == 0):
		$coffre_ferme.hide()
	else :
		$coffre_ouvert.hide()
	$sortie_resto.show()


func _on_sortie_resto_pressed():
	$bg_resto.hide()
	$sortie_resto.hide()
	$RestoMini.show()
	if(state_coffre == 0):
		$coffre_ferme.show()
	else :
		$coffre_ouvert.show()
