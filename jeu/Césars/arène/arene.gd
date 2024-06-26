extends Control
signal anagrammeFini
signal anagrammeFaux
signal aveCesar
signal bravo
signal text_long
signal dialogue_entree

# Called when the node enters the scene tree for the first time.
func _ready():
	$ParchTexte.hide();
	$AveCaesar.hide();
	$anagramme_texte.hide();
	$anagramme_conseil.hide();
	$anagramme_texte/porte_button.hide();
	emit_signal("dialogue_entree")
	
###---------------------------------------------Emission de signaux
#Signal quand l'anagramme est bien complété
func bravoo():
	emit_signal("bravo");
	$anagramme_texte/porte_button.show();

#Signal quand l'anagramme est Faux
func mauvais_texte():
	emit_signal("anagrammeFaux");

#Signal qsi l'anagramme est "ave Cesar" (une lettre manquante)
func ave_cesar():
	emit_signal("aveCesar");

#Signal si le texte écrit est trop long	
func texte_long():
	emit_signal("text_long");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


###---------------------------------------------Pression des BOUTONS
func _on_parch_roule_pressed():
	$ParchTexte.show();


func _on_parch_texte_pressed():
	$ParchTexte.hide();


func _on_vae_casera_pressed():
	$anagramme_texte.show();


func _on_vae_casera_mouse_entered():
	$anagramme_conseil.show();


func _on_vae_casera_mouse_exited():
	$anagramme_conseil.hide();

#Bouton porte pour sortir de la scène
func _on_porte_button_pressed():
	emit_signal("anagrammeFini")
	
	
###---------------------------------------------écriture dans zone de TEXTE
#Dès que le texte est changé
func _on_anagramme_texte_text_changed(new_text):
	if new_text.to_upper() == "AVE CESAR":
		ave_cesar();
	if len(new_text)>10:
		texte_long();
	else:
		mauvais_texte();

#Dès que le texte est soumis (en faisant entrée)
func _on_anagramme_texte_text_submitted(new_text):
	if new_text.to_upper() == "AVE CAESAR":
		bravoo();
	elif len(new_text)>10:
		texte_long();
		
	elif new_text.to_upper() == "AVE CESAR":
		ave_cesar();
		
	else:
		mauvais_texte();

