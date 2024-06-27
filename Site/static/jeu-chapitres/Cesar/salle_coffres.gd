extends Control
var feu_vert = 0

var feu_vert1_instancie = false
var feu_vert2_instancie = false
var feu_vert3_instancie = false
var feu_vert4_instancie = false
var feu_vert5_instancie = false

signal all_coffres_open
var var_all_coffres_open = false


#SORTIE DE LA SCENE
signal sortie_salle_coffres

# Called when the node enters the scene tree for the first time.
func _ready():
	$coffres_background.hide()
	$trappe_background.hide()
	emit_signal("feux_eteints")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func feux_fermes():
	$trappe_background/feu_vert_coffre1.hide()
	$trappe_background/feu_vert_coffre2.hide()
	$trappe_background/feu_vert_coffre3.hide()
	$trappe_background/feu_vert_coffre4.hide()
	$trappe_background/feu_vert_coffre5.hide()

func _on_trappe_background_feux_eteints():
	feux_fermes()

	
###---------------------------------------------------COFFRES
#Entrée Coffre1
func _on_salle_coffres_background_entree_coffre_1():
	$salle_coffres_background.hide()
	$coffres_background.show()
	
#feu vert coffre 1 <=> coffre1 ouvert
func _on_coffres_background_coffre_1_ouvert():
	$trappe_background/feu_vert_coffre1.show()
	if not feu_vert1_instancie:
		feu_vert1_instancie = true
		feu_vert += 1
		if feu_vert == 5 and not var_all_coffres_open :
			var_all_coffres_open = true
			emit_signal("all_coffres_open")
			
	
	
#Entrée Coffre2
func _on_salle_coffres_background_entree_coffre_2():
	$salle_coffres_background.hide()
	$coffres_background.show()

#feu vert coffre 2 <=> coffre2 ouvert
func _on_coffres_background_coffre_2_ouvert():
	$trappe_background/feu_vert_coffre2.show()
	if not feu_vert2_instancie:
		feu_vert2_instancie = true
		feu_vert += 1
		if feu_vert == 5 and not var_all_coffres_open :
			var_all_coffres_open = true
			emit_signal("all_coffres_open")
	

#Entrée Coffre3
func _on_salle_coffres_background_entree_coffre_3():
	$salle_coffres_background.hide()
	$coffres_background.show()

#feu vert coffre 3 <=> coffre3 ouvert
func _on_coffres_background_coffre_3_ouvert():
	$trappe_background/feu_vert_coffre3.show()
	if not feu_vert3_instancie:
		feu_vert3_instancie = true
		feu_vert += 1
		if feu_vert == 5 and not var_all_coffres_open :
			var_all_coffres_open = true
			emit_signal("all_coffres_open")
	
	
#Entrée Coffre4
func _on_salle_coffres_background_entree_coffre_4():
	$salle_coffres_background.hide()
	$coffres_background.show()

#feu vert coffre 4 <=> coffre4 ouvert
func _on_coffres_background_coffre_4_ouvert():
	$trappe_background/feu_vert_coffre4.show()
	if not feu_vert4_instancie:
		feu_vert4_instancie = true
		feu_vert += 1
		if feu_vert == 5 and not var_all_coffres_open :
			var_all_coffres_open = true
			emit_signal("all_coffres_open")
	
	
#Entrée Coffre5
func _on_salle_coffres_background_entree_coffre_5():
	$salle_coffres_background.hide()
	$coffres_background.show()

#feu vert coffre 5 <=> coffre5 ouvert
func _on_coffres_background_coffre_5_ouvert():
	$trappe_background/feu_vert_coffre5.show()
	if not feu_vert5_instancie:
		feu_vert5_instancie = true
		feu_vert += 1
		if feu_vert == 5 and not var_all_coffres_open :
			var_all_coffres_open = true
			emit_signal("all_coffres_open")
	
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


###---------------------------------------------------SORTIE DE LA SCENE
func _on_trappe_background_dinguerie():
	emit_signal("sortie_salle_coffres")
