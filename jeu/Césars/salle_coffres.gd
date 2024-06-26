extends Control
#var feu_vert1 = 0
#var feu_vert2 = 0
#var feu_vert3 = 0
#var feu_vert4 = 0
#var feu_vert5 = 0
var feu_vert = 0

var feu_vert1_instancie = false
var feu_vert2_instancie = false
var feu_vert3_instancie = false
var feu_vert4_instancie = false
var feu_vert5_instancie = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$coffres_background.hide()
	$trappe_background.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

###---------------------------------------------------COFFRES
#Entrée Coffre1
func _on_salle_coffres_background_entree_coffre_1():
	$salle_coffres_background.hide()
	$coffres_background.show()

#Entrée Coffre2
func _on_salle_coffres_background_entree_coffre_2():
	$salle_coffres_background.hide()
	$coffres_background.show()

#Entrée Coffre3
func _on_salle_coffres_background_entree_coffre_3():
	$salle_coffres_background.hide()
	$coffres_background.show()

#Entrée Coffre4
func _on_salle_coffres_background_entree_coffre_4():
	$salle_coffres_background.hide()
	$coffres_background.show()

#Entrée Coffre5
func _on_salle_coffres_background_entree_coffre_5():
	$salle_coffres_background.hide()
	$coffres_background.show()

#retour coffre vers salle
func _on_coffres_background_retour_salle():
	$salle_coffres_background.show()
	$coffres_background.hide()
	
	
###---------------------------------------------------TRAPPE
#Entrée Trappe
func _on_salle_coffres_background_entree_trappe():
	$trappe_background.show()
	$coffres_background.hide()
	$salle_coffres_background.hide()
	
#retour trappe vers salle
func _on_trappe_background_retour_salle():
	$trappe_background.hide()
	$salle_coffres_background.show()


func _on_coffres_background_coffre_1_ouvert():
	$trappe_background/feu_vert_coffre1.show()
	if not feu_vert1_instancie:
		feu_vert1_instancie = true
		feu_vert += 1
	print(feu_vert)


func _on_coffres_background_coffre_2_ouvert():
	$trappe_background/feu_vert_coffre2.show()
	if not feu_vert2_instancie:
		feu_vert2_instancie = true
		feu_vert += 1
	print(feu_vert)

func _on_coffres_background_coffre_3_ouvert():
	$trappe_background/feu_vert_coffre3.show()
	if not feu_vert3_instancie:
		feu_vert3_instancie = true
		feu_vert += 1
	print(feu_vert)

func _on_coffres_background_coffre_4_ouvert():
	$trappe_background/feu_vert_coffre4.show()
	if not feu_vert4_instancie:
		feu_vert4_instancie = true
		feu_vert += 1
	print(feu_vert)

func _on_coffres_background_coffre_5_ouvert():
	$trappe_background/feu_vert_coffre5.show()
	if not feu_vert5_instancie:
		feu_vert5_instancie = true
		feu_vert += 1
	print(feu_vert)
