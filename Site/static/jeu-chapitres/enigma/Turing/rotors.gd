extends Node2D

var is_ready = false
var ready1 = false
var ready2 = false
var ready3 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Interne/Good.hide()
	update_interne()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# mets tout à jour dès lors qu'un rotor a changé
func one_rotor_changed():
	print("one rotor changed")
	ready1 = $Interne/Rotor1.is_ready
	ready2 = $Interne/Rotor2.is_ready
	ready3 = $Interne/Rotor3.is_ready
	is_ready = ready1 and ready2 and ready3
	update_square()
	update_interne()

# mets à jour le carré
func update_square():
	if is_ready:
		$Interne/Bad.hide()
		$Interne/Good.show()
	else:
		$Interne/Bad.show()
		$Interne/Good.hide()

# remets les positions des rotors sur A
func reset_positions():
	$Interne/Rotor1.reset_position()
	$Interne/Rotor2.reset_position()
	$Interne/Rotor3.reset_position()
	update_interne()


# code une lettre par un rotor
func rotors_cypher(lettre):
	lettre = $Interne/Rotor1.cypher_rotor(lettre)
	print("Rotor 1 : ", lettre)
	lettre = $Interne/Rotor2.cypher_rotor(lettre)
	print("Rotor 2 : ", lettre)
	lettre = $Interne/Rotor3.cypher_rotor(lettre)
	print("Rotor 3 : ", lettre)
	return lettre 

# code une lettre sur le chemin du retour
func rotor_retour_cypher(lettre):
	lettre = $Interne/Rotor3.cypher_reciproque(lettre)
	print("Rotor 3 : ", lettre)
	lettre = $Interne/Rotor2.cypher_reciproque(lettre)
	print("Rotor 2 : ", lettre)
	lettre = $Interne/Rotor1.cypher_reciproque(lettre)
	print("Rotor 1 : ", lettre)
	return lettre


# rotation des rotors
func tourner_rotor():
	if $Interne/Rotor1.is_ready:
		$Interne/Rotor1.rotate_rotor()
		if $Interne/Rotor2.is_ready:
			$Interne/Rotor1.nb_rotation = ($Interne/Rotor1.nb_rotation + 1) % 26
			if $Interne/Rotor1.nb_rotation == 0:
				$Interne/Rotor2.rotate_rotor()
				if $Interne/Rotor3.is_ready:
					$Interne/Rotor2.nb_rotation = ($Interne/Rotor2.nb_rotation + 1) % 26
					if $Interne/Rotor2.nb_rotation == 0:
						$Interne/Rotor3.rotate_rotor()
	update_interne()


signal retour

# si le joueur veut retourner sur le clavier
func _on_button_pressed():
	$Interne.hide()
	retour.emit()

# met à jour les labels
func update_interne():
	$AffichageRotors/LabelRotor.text = $Interne/Rotor1.texte
	$AffichageRotors/LabelRotor2.text = $Interne/Rotor2.texte
	$AffichageRotors/LabelRotor3.text = $Interne/Rotor3.texte


signal aide_rotors

# signale a enigma que le joueur veut une explication
func _on_aide_rotors_pressed():
	aide_rotors.emit()
