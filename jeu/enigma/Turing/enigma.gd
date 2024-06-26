extends Node2D

signal light(lettre)



# Called when the node enters the scene tree for the first time.
func _ready():
	$Cables.hide();
	lights_off();
	$Rotors/Interne.hide();
	$Reflecteur.hide()

func lights_off():
	for child in $Light.get_children():
		child.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_config_cables_pressed():
	$ClavierEnigma.hide();
	$Light.hide();
	$Boutons.hide();
	$Cables.show();
	$Rotors/AffichageRotors.hide();


func _on_retour():
	$Cables.hide();
	$ClavierEnigma.show();
	$Light.show();
	$Rotors/Interne.hide();
	$Reflecteur.hide();
	$Rotors/AffichageRotors.show();
	$Boutons.show();


func clavier_pressed(lettre):
	
	lights_off()
	
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
	
	light.emit(lettre)
	
	$Rotors.tourner_rotor()
	
	return lettre


func _on_config_rotors_pressed():
	$ClavierEnigma.hide();
	$Light.hide();
	$Boutons.hide();
	$Cables.hide();
	$Rotors/Interne.show();



func _on_acces_reflecteur_pressed():
	$ClavierEnigma.hide();
	$Light.hide();
	$Boutons.hide();
	$Cables.hide();
	$Reflecteur.show();
	$Rotors/AffichageRotors.hide()

