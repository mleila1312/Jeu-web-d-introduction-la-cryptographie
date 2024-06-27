extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ArrierePlanBureau.hide()
	$"MauvaiseClé".hide()
	$ArrierePlanBureau2.hide()
	$"ScèneFinaleBonneClé".hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



# Fonction pour déchiffrer un texte en utilisant la clé de type Vigenère
func decrypt_text(encrypted_text: String, key: String) -> String:
	var decrypted_text := ""
	var key_length := key.length()
	var key_index := 0
	
	for i in range(encrypted_text.length()):
		var char := encrypted_text[i]
		var char_code := int(char.unicode_at(0))
		print("Caractère actuel : ", char, " Code ASCII : ", char_code)
		
		# Vérifie si le caractère est une lettre majuscule (A-Z)
		if char_code >= int('A'.unicode_at(0)) and char_code <= int('Z'.unicode_at(0)):
			var shift := (key[key_index].to_lower()).unicode_at(0) - ('a').unicode_at(0)
			var base := ('A').unicode_at(0)
			var decrypted_char := char_code - shift
			print("Majuscule détectée. Décalage : ", shift, " Code déchiffré : ", decrypted_char)
			
			# Boucle autour de l'alphabet
			if decrypted_char < base:
				decrypted_char += 26  # Il y a 26 lettres dans l'alphabet
			decrypted_text += String.chr(decrypted_char)
			print("Caractère déchiffré : ", String.chr(decrypted_char))
			
			# Avance dans la clé
			key_index = (key_index + 1) % key_length
		
		# Vérifie si le caractère est une lettre minuscule (a-z)
		elif char_code >= ('a').unicode_at(0) and char_code <= ('z').unicode_at(0):
			var shift := (key[key_index].to_lower()).unicode_at(0) - ('a').unicode_at(0)
			var base := ('a').unicode_at(0)
			var decrypted_char := char_code - shift
			print("Minuscule détectée. Décalage : ", shift, " Code déchiffré : ", decrypted_char)
			
			# Boucle autour de l'alphabet
			if decrypted_char < base:
				decrypted_char += 26  # Il y a 26 lettres dans l'alphabet
			
			decrypted_text += String.chr(decrypted_char)
			print("Caractère déchiffré : ", String.chr(decrypted_char))
			
			# Avance dans la clé
			key_index = (key_index + 1) % key_length
		
		else:
			decrypted_text += char  # Ajoute les caractères non alphabétiques sans modification
			print("Caractère non alphabétique ajouté : ", char)
	
	return decrypted_text






func _on_texture_button_pressed():
	var entered_word =$CryptanalyseFondGlobal/Lettre1 .text + $CryptanalyseFondGlobal/Lettre2.text + $CryptanalyseFondGlobal/Lettre3.text
	entered_word = entered_word.to_lower();
	var encrypted_text := "Hwr Mwm wqii-imhm, 
	Xza qjbw nwro crz lspki hmpjlmz yyd nedb zdjvzz qjv gjmym, crz uigwhdm hjcgz, crz uigwhdm gcmvz. Ri hm pvvkpqw hwm vcwnq hz kin qrnbeibw qwpza, pjqr ymw mmkvzhn agmcxvbipzw, gwmi lin wvzqpgmw hipqmmgteibw. Vkgzxxz usi pyhjpz igxwvy mx kmvhmxn-usd l'iozi gm vzxmo yyz by xpimklza, upm xp linqvza. Hvvw g'wqwzi ym pv vydb, rja wzkvzbw nmvjvx ymw zbsdtin jvdtpvvxza, io vsn zmmmw, ymw ewcvcb dvinbmhifgmw, ymw ewcvcb zuimdidtpza. 
	Nz b'eobiilvvq eqmg dutvbmzvgz. 
	I nvueda xdmrim, Kvjvdmpgm"
	print("hey")
	var decrypted_text := decrypt_text(encrypted_text, entered_word)
	$CryptanalyseFondGlobal/RichTextLabel.text = decrypted_text;
	print(decrypted_text)


func _on_texture_button_pressed_vers_outils():
	$ArrierePlanBureau.show()
	$"ArrierePlanBureau/LettresFréquenceTexte".hide()
	$"ArrierePlanBureau/LettresFréquencesFrançais".hide()
	$CryptanalyseFondGlobal.hide()



func _on_texture_button_pressed_retour():
	$ArrierePlanBureau.hide()
	$CryptanalyseFondGlobal.show()
	

func _on_texture_button_pressed_valider():
	var entered_word = $CryptanalyseFondGlobal/Lettre1.text + $CryptanalyseFondGlobal/Lettre2.text + $CryptanalyseFondGlobal/Lettre3.text
	if entered_word.to_upper() == "VIE":
		print("Félicitations vous avez retrouvé la clé de chiffrement")
		$CryptanalyseFondGlobal.hide()
		$ArrierePlanBureau.hide()
		$"MauvaiseClé".hide()
		$"ScèneFinaleBonneClé".show()
	else:
		print("Veuillez réessayer, la clé trouvée est fausse")
		$"MauvaiseClé".show();
		$CryptanalyseFondGlobal.hide();
		await get_tree().create_timer(3.0).timeout;
		$"MauvaiseClé".hide();
		$CryptanalyseFondGlobal.show();


func _on_texture_button_pressed_aide():
	$CryptanalyseFondGlobal.hide()
	$ArrierePlanBureau2.show()


func _on_texture_button_pressed_retour_aide():
	$CryptanalyseFondGlobal.show()
	$ArrierePlanBureau2.hide()
