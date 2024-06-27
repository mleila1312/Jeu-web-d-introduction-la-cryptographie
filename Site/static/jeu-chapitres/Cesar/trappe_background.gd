extends Sprite2D
signal feux_eteints
signal retour_salle

#Codes de droite
var code1_fait = false
var code2_fait = false
var code3_fait = false
var code4_fait = false
var code5_fait = false

var var_codes_bons = 0
signal all_codes_bons
var var_all_codes_bons = false

#Codes médailles
var medaille_or_fait = false
signal feu_vert_or

var medaille_argent_fait = false
signal feu_vert_argent

var medaille_bronze_fait = false
signal feu_vert_bronze

var var_medailles_bons = 0
signal all_medailles_bons
var var_all_medailles_bons = false

#Trappe
var var_trappe = 0
var trappe_codes = false
var trappe_medailles = false
var var_trappe_ouverte = false
signal trappe_ouverte

signal dinguerie
# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("feux_eteints")
	codes_hide()
	$cadena_ouvert.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func codes_hide():
	$code1.hide()
	$code2.hide()
	$code3.hide()
	$code4.hide()
	$code5.hide()
	$code_or.hide()
	$code_argent.hide()
	$code_bronze.hide()
	$commentaires.hide()
	$feu_vert_codes.hide()
	$feu_vert_medaille_or.hide()
	$feu_vert_medaille_argent.hide()
	$feu_vert_medaille_bronze.hide()

func codes_show():
	$code1.show()
	$code2.show()
	$code3.show()
	$code4.show()
	$code5.show()
	$code_or.show()
	$code_argent.show()
	$code_bronze.show()
	$commentaires.show()
	
func code_bon():
	$commentaires.text = "Code bon"
	
func code_faux():
	$commentaires.text = "Code faux"
	
func commentaire():
	$commentaires.text = "Remplis les cases et faire
	'Entrer' pour ouvrir la trappe"	


func _on_retour_button_pressed():
	emit_signal("retour_salle")

#Une fois que tous les coffres sont ouverts, le joueur peut essayer d'ouvrir la trappe
func _on_salle_coffres_all_coffres_open():
	codes_show()
	
###---------------------------------------------TEXTES CODES
#Code 1 soumis
func _on_code_1_text_submitted(new_text):
	if new_text == "90":
		code_bon()
		if not code1_fait :
			code1_fait = true
			var_codes_bons += 1
			print(var_codes_bons)
			print(var_all_codes_bons)
			if var_codes_bons == 5 and not var_all_codes_bons:
				emit_signal("all_codes_bons")
				var_all_codes_bons = true

	else :
		code_faux()
		

func _on_code_2_text_submitted(new_text):
	if new_text == "500":
		code_bon()
		if not code2_fait :
			code2_fait = true
			var_codes_bons += 1
			print(var_codes_bons)
			print(var_all_codes_bons)
			if var_codes_bons == 5 and not var_all_codes_bons:
				emit_signal("all_codes_bons")
				var_all_codes_bons = true
	else :
		code_faux()


func _on_code_3_text_submitted(new_text):
	if new_text == "19":
		code_bon()
		if not code3_fait :
			code3_fait = true
			var_codes_bons += 1
			print(var_codes_bons)
			print(var_all_codes_bons)
			if var_codes_bons == 5 and not var_all_codes_bons:
				emit_signal("all_codes_bons")
				var_all_codes_bons = true
	else :
		code_faux()


func _on_code_4_text_submitted(new_text):
	if new_text == "1":
		code_bon()
		if not code4_fait :
			code4_fait = true
			var_codes_bons += 1
			print(var_codes_bons)
			print(var_all_codes_bons)
			if var_codes_bons == 5 and not var_all_codes_bons:
				emit_signal("all_codes_bons")
				var_all_codes_bons = true
	else :
		code_faux()


func _on_code_5_text_submitted(new_text):
	if new_text == "4":
		code_bon()
		if not code5_fait :
			code5_fait = true
			var_codes_bons += 1
			print(var_codes_bons)
			print(var_all_codes_bons)
			if var_codes_bons == 5 and not var_all_codes_bons:
				emit_signal("all_codes_bons")
				var_all_codes_bons = true
	else :
		code_faux()

###---------------------------------------------TEXTES MEDAILLES
#Code médaille or soumis
func _on_code_or_text_submitted(new_text):
	if new_text == "44":
		code_bon()
		if not medaille_or_fait:
			medaille_or_fait = true
			var_medailles_bons += 1
			emit_signal("feu_vert_or")
			print(var_medailles_bons)
			if var_medailles_bons == 3 and not var_all_medailles_bons:
				var_all_medailles_bons = true
				emit_signal("all_medailles_bons")
			
	else :
		code_faux()

#Affichage feu vert médaille or
func _on_feu_vert_or():
	$feu_vert_medaille_or.show()


#Code médaille argent soumis
func _on_code_argent_text_submitted(new_text):
	if new_text == "14":
		code_bon()
		if not medaille_argent_fait:
			medaille_argent_fait = true
			var_medailles_bons += 1
			emit_signal("feu_vert_argent")
			print(var_medailles_bons)
			if var_medailles_bons == 3 and not var_all_medailles_bons:
				var_all_medailles_bons = true
				emit_signal("all_medailles_bons")
			
	else :
		code_faux()


#Affichage feu vert médaille argent
func _on_feu_vert_argent():
	$feu_vert_medaille_argent.show()

#Code médaille bronze soumis
func _on_code_bronze_text_submitted(new_text):
	if new_text == "30":
		code_bon()
		if not medaille_bronze_fait:
			medaille_bronze_fait = true
			var_medailles_bons += 1
			emit_signal("feu_vert_bronze")
			print(var_medailles_bons)
			if var_medailles_bons == 3 and not var_all_medailles_bons:
				var_all_medailles_bons = true
				emit_signal("all_medailles_bons")		
	else :
		code_faux()

#Affichage feu vert médaille bronze
func _on_feu_vert_bronze():
	$feu_vert_medaille_bronze.show()

###----------------------------------------CODES BONS
#5 codes de doite bons
func _on_all_codes_bons():
	$feu_vert_codes.show()
	if not trappe_codes:
		trappe_codes = true
		var_trappe += 1
		print("Trappe:",var_trappe)
		if var_trappe == 2 and not var_trappe_ouverte:
			var_trappe_ouverte = true
			emit_signal("trappe_ouverte")

#3 codes médailles bons
func _on_all_medailles_bons():
	if not trappe_medailles:
		trappe_medailles = true
		var_trappe += 1
		print("Trappe:",var_trappe)
		if var_trappe == 2 and not var_trappe_ouverte:
			var_trappe_ouverte = true
			emit_signal("trappe_ouverte")

#cadenas ouvert
func _on_trappe_ouverte():
	$cadena_ouvert.show()
	$cadena_ferme.hide()
	$commentaires.text = "Trappe ouverte, félicitations !"
	
#Pour sortir de la scène de la salle des coffres
func _on_cadena_ouvert_pressed():
	emit_signal("dinguerie")


#########################################################TEST pour codes 
func _on_code_1_text_changed(new_text):
	commentaire()


func _on_code_2_text_changed(new_text):
	commentaire()


func _on_code_3_text_changed(new_text):
	commentaire()


func _on_code_4_text_changed(new_text):
	commentaire()


func _on_code_5_text_changed(new_text):
	commentaire()


func _on_code_or_text_changed(new_text):
	commentaire()


func _on_code_argent_text_changed(new_text):
	commentaire()


func _on_code_bronze_text_changed(new_text):
	commentaire()


func _on_code_1_focus_entered():
	commentaire()


func _on_code_2_focus_entered():
	commentaire()


func _on_code_3_focus_entered():
	commentaire()


func _on_code_4_focus_entered():
	commentaire()


func _on_code_5_focus_entered():
	commentaire()


func _on_code_or_focus_entered():
	commentaire()


func _on_code_argent_focus_entered():
	commentaire()


func _on_code_bronze_focus_entered():
	commentaire()



