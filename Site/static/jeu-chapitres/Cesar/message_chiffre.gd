extends Sprite2D
#variables pour les mots
var var_l4_mot1 = false
var var_l4_mot2 = false
var var_l4_mot3 = false

var var_l8_mot1 = false
var var_l8_mot2 = false
var var_l8_mot3 = false
var var_l8_mot4 = false

#signaux
signal all_mots_faits
var var_mots_complets = 0
var mots_complets = false

signal sortie_message


# Called when the node enters the scene tree for the first time.
func _ready():
	$commentaire.show()
	
func mot_valide():
	$commentaire.text = "Mot Validé"
	
func mot_faux():
	$commentaire.text = "Mot Invalide"

func commentaire():
	$commentaire.text = "Clique sur 'Entrer' pour valider le mot"

###------------------------------------------------------------------MOTS
###LIGNE4
#Mot1
func _on_l_4_mot_1_text_changed(new_text):
	commentaire()

func _on_l_4_mot_1_text_submitted(new_text):
	if new_text.to_upper() == "RESIDENCE":
		mot_valide()
		if not var_l4_mot1:
			var_l4_mot1 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()

#Mot2
func _on_l_4_mot_2_text_changed(new_text):
	commentaire()


func _on_l_4_mot_2_text_submitted(new_text):
	if new_text.to_upper() == "DE":
		mot_valide()
		if not var_l4_mot2:
			var_l4_mot2 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()

#Mot3
func _on_l_4_mot_3_text_changed(new_text):
	commentaire()


func _on_l_4_mot_3_text_submitted(new_text):
	if new_text.to_upper() == "SERAPHUS":
		mot_valide()
		if not var_l4_mot3:
			var_l4_mot3 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()

###LIGNE8
#Mot1
func _on_l_8_mot_1_text_changed(new_text):
	commentaire()

func _on_l_8_mot_1_text_submitted(new_text):
	if new_text.to_upper() == "PROCHAIN":
		mot_valide()
		if not var_l8_mot1:
			var_l8_mot1 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()


#Mot2
func _on_l_8_mot_2_text_changed(new_text):
	commentaire()

func _on_l_8_mot_2_text_submitted(new_text):
	if new_text.to_upper() == "ATTENTAT":
		mot_valide()
		if not var_l8_mot2:
			var_l8_mot2 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()


#Mot3
func _on_l_8_mot_3_text_changed(new_text):
	commentaire()

func _on_l_8_mot_3_text_submitted(new_text):
	if new_text.to_upper() == "CONTRE":
		mot_valide()
		if not var_l8_mot3:
			var_l8_mot3 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()



func _on_l_8_mot_4_text_changed(new_text):
	commentaire()


func _on_l_8_mot_4_text_submitted(new_text):
	if new_text.to_upper() == "LA":
		mot_valide()
		if not var_l8_mot4:
			var_l8_mot4 = true
			var_mots_complets += 1
			if var_mots_complets == 7 and not mots_complets:
				mots_complets = true
				emit_signal("all_mots_faits")
	else :
		mot_faux()


###----------------------------------------------------SORTIE DU MESSAGE DECHIFFRE RETOUR PORTE
func _on_porte_button_pressed():
	emit_signal("sortie_message")
