extends Sprite2D
signal coffre1_ouvert
signal coffre2_ouvert
signal coffre3_ouvert
signal coffre4_ouvert
signal coffre5_ouvert
signal retour_salle

# Called when the node enters the scene tree for the first time.
func _ready():
	coffres_fermes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func code_faux() :
	$commentaires.text = "Code faux"

func code_bon():
	$commentaires.text = "Code bon"

func commentaire_nb():
	$commentaires.text = "Entre un nombre et fais 'Entrer
		  pour ouvrir le coffre"
	
	
func coffres_fermes():
	$coffre1_ouvert.hide()
	$coffre2_ouvert.hide()
	$coffre3_ouvert.hide()
	$coffre4_ouvert.hide()
	$coffre5_ouvert.hide()
	
func coffre1():
	$coffre1_ouvert.show()
	$coffre1_ouvert/indice1_background.hide()

func coffre2():
	$coffre2_ouvert.show()
	$coffre2_ouvert/indice2_background.hide()

func coffre3():
	$coffre3_ouvert.show()
	$coffre3_ouvert/indice3_background.hide()

func coffre4():
	$coffre4_ouvert.show()
	$coffre4_ouvert/indice4_background.hide()
	
func coffre5():
	$coffre5_ouvert.show()
	$coffre5_ouvert/indice5_background.hide()
	
		
###-----------------------COFFRE1
#Zoom coffre1
func _on_salle_coffres_background_entree_coffre_1():
	coffres_fermes()
	$coffre1.show()
	$coffre2.hide()
	$coffre3.hide()
	$coffre4.hide()	
	$coffre5.hide()
	commentaire_nb()
	
#Texte soumis
func _on_code_1_text_submitted(new_text):
	if new_text == "19":
		emit_signal("coffre1_ouvert")
		code_bon()
		coffre1()
	else :
		code_faux()

#Objet1 pressé
func _on_indice_1_pressed():
	$coffre1_ouvert/indice1_background.show()

#Indice1 pressé
func _on_indice_1_background_pressed():
	$coffre1_ouvert/indice1_background.hide()
	
	
###-----------------------COFFRE2
#Zoom coffre2
func _on_salle_coffres_background_entree_coffre_2():
	coffres_fermes()
	$coffre1.hide()
	$coffre2.show()
	$coffre3.hide()
	$coffre4.hide()	
	$coffre5.hide()
	commentaire_nb()
	
#Texte soumis
func _on_code_2_text_submitted(new_text):
	if new_text == "30":
		emit_signal("coffre2_ouvert")
		code_bon()
		coffre2()
	else :
		code_faux()

func _on_indice_2_pressed():
	$coffre2_ouvert/indice2_background.show()

func _on_indice_2_background_pressed():
	$coffre2_ouvert/indice2_background.hide()
		
###-----------------------COFFRE3
#Zoom coffre3
func _on_salle_coffres_background_entree_coffre_3():
	coffres_fermes()
	$coffre1.hide()
	$coffre2.hide()
	$coffre3.show()
	$coffre4.hide()	
	$coffre5.hide()
	commentaire_nb()
	
#Texte soumis
func _on_code_3_text_submitted(new_text):
	if new_text == "39":
		emit_signal("coffre3_ouvert")
		code_bon()
		coffre3()
	else :
		code_faux()

func _on_indice_3_pressed():
	$coffre3_ouvert/indice3_background.show()


func _on_indice_3_background_pressed():
	$coffre3_ouvert/indice3_background.hide()
	
###-----------------------COFFRE4
#Zoom coffre4
func _on_salle_coffres_background_entree_coffre_4():
	coffres_fermes()
	$coffre1.hide()
	$coffre2.hide()
	$coffre3.hide()
	$coffre4.show()	
	$coffre5.hide()
	commentaire_nb()
	
#Texte soumis
func _on_code_4_text_submitted(new_text):
	if new_text == "9":
		emit_signal("coffre4_ouvert")
		code_bon()
		coffre4()
	else :
		code_faux()
		
func _on_indice_4_pressed():
	$coffre4_ouvert/indice4_background.show()


func _on_indice_4_background_pressed():
	$coffre4_ouvert/indice4_background.hide()
		
###-----------------------COFFRE5
#Zoom coffre5
func _on_salle_coffres_background_entree_coffre_5():
	coffres_fermes()
	$coffre1.hide()
	$coffre2.hide()
	$coffre3.hide()
	$coffre4.hide()	
	$coffre5.show()
	commentaire_nb()

#Texte soumis	
func _on_code_5_text_submitted(new_text):
	if new_text == "303":
		emit_signal("coffre5_ouvert")
		code_bon()
		coffre5()
	else :
		code_faux()

func _on_indice_5_pressed():
	$coffre5_ouvert/indice5_background.show()


func _on_indice_5_background_pressed():
	$coffre5_ouvert/indice5_background.hide()
		
###-----------------------RETOUR
func _on_retour_button_pressed():
	emit_signal("retour_salle")

