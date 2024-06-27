extends Node2D

signal light(lettre)


var suite = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Cables.hide();
	lights_off();
	$Rotors/Interne.hide();
	$Reflecteur.hide()
	$Rotors/AideRotors.hide()
	$Rotors/ColorRect.hide()

# éteint les lumières 
func lights_off():
	for child in $Light.get_children():
		child.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# si le joueur veut accéder à l'écran de configuration des connecteurs
func _on_config_cables_pressed():
	$ClavierEnigma.hide();
	$Light.hide();
	$Boutons.hide();
	$Cables.show();
	$Rotors/AffichageRotors.hide();
	$Rotors/ColorRect.hide()
	$Suite.hide()


signal enigma_main

# si le joueur veut revenir d'un écran de configuration au clavier
func _on_retour():
	$Cables.hide();
	$ClavierEnigma.show();
	$Light.show();
	$Rotors/Interne.hide();
	$Reflecteur.hide();
	$Rotors/AffichageRotors.show();
	$Boutons.show();
	$Rotors/AideRotors.hide()
	$Rotors/ColorRect.hide()
	if not suite:
		$Suite.show()
	enigma_main.emit()

# lorsque le joueur appuie sur une touche du clavier de la machine enigma
func clavier_pressed(lettre):
	
	# éteint les lumières
	lights_off()
	
	# code par les connecteurs, puis par les rotors, puis par le réflecteur, puis les rotors et enfin les connecteurs
	print("Nouvelle lettre...")
	print("A coder : ", lettre)
	lettre = $Cables.swap(lettre)
	print("Cables : ", lettre)
	lettre = $Rotors.rotors_cypher(lettre)
	print("Rotors : ", lettre)
	lettre = $Reflecteur.reflexion_cypher(lettre)
	print("Reflecteur : ", lettre)
	lettre = $Rotors.rotor_retour_cypher(lettre)
	print("Retour rotors : ", lettre)
	lettre = $Cables.swap(lettre)
	print("Retour cables : ", lettre)
	
	# éclaire la lettre correspondante
	light.emit(lettre)
	
	# tourne les rotors
	$Rotors.tourner_rotor()
	
	return lettre

# # si le joueur veut accéder au panneau de configuration des rotors
func _on_config_rotors_pressed():
	$ClavierEnigma.hide();
	$Light.hide();
	$Boutons.hide();
	$Cables.hide();
	$Rotors/AideRotors.show()
	$Rotors/Interne.show();
	$Rotors/ColorRect.show()
	$Suite.hide()


# si le joueur veur accéder au panneau de configuration du réflecteur
func _on_acces_reflecteur_pressed():
	$ClavierEnigma.hide();
	$Light.hide();
	$Boutons.hide();
	$Cables.hide();
	$Reflecteur.show();
	$Rotors/AffichageRotors.hide()
	$Suite.hide()


# si le joueur veut demander une explication 

signal aide_generale
signal aide_rotors
signal aide_cables
signal aide_reflecteurs

func _on_aide_generale_pressed():
	aide_generale.emit()

func _on_rotors_aide_rotors():
	aide_rotors.emit()

func _on_cables_aide_cables():
	aide_cables.emit()

func _on_reflecteur_aide_reflecteur():
	aide_reflecteurs.emit()


signal suite_enigma 

# si le joueur veut passer à la phase suivante 
func _on_suite_pressed():
	suite_enigma.emit()
	suite = true
