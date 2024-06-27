extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	espion_dialogue_off();
	$BgFront.show()
	$BgInside.hide();
	$Face.hide();
	turing_dialogue_off();
	$BgInside/Table/EnigmaTable.hide();
	$Enigma.hide();
	$BgFront/EspionDialogue.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# affiche la bulle de l'espion
func espion_dialogue_on():
	$BgFront/EspionDialogue.show();

# retire la bulle de l'espion
func espion_dialogue_off():
	$BgFront.hide();
	$BgInside.show();
	$Face.show();

# si le main dit qu'il faut afficher la bulle de dialogue de l'espion
func _on_main_espion_dialogue_on():
	espion_dialogue_on();

# si le main dit qu'il faut supprimer le bulle de dialogue de l'espion
func _on_main_espion_dialogue_off():
	espion_dialogue_off();

# affiche la bulle de dialogue de turing
func turing_dialogue_on():
	$Face/TuringDialogue.show();

# supprime la bulle de dialogue de turing
func turing_dialogue_off():
	$Face/TuringDialogue.hide();

# si le main dit qu'il faut supprimer la bulle de dialogue de turing
func _on_main_turing_dialogue_off():
	turing_dialogue_off();

# si le main dit qu'il faut afficher la bulle de dialogue de turing
func _on_main_turing_dialogue_on():
	turing_dialogue_on();

# si le main décide qu'il est possible d'activer le bouton qui permet d'accéder à enigma
func _on_main_activate_table():
	$BgInside/Table/EnigmaTable.show();


signal turing_when_enigma

# préviens le main que le joueur est sur la machine enigma
func _on_enigma_table_pressed():
	$BgInside.hide();
	$Enigma.show();
	turing_when_enigma.emit()



signal aide_cables
signal aide_generale
signal aide_reflecteur
signal aide_rotors

#préviens le main que le joueur a demandé une aide

func _on_enigma_aide_cables():
	aide_cables.emit()

func _on_enigma_aide_generale():
	aide_generale.emit()

func _on_enigma_aide_reflecteurs():
	aide_reflecteur.emit()

func _on_enigma_aide_rotors():
	aide_rotors.emit()


signal enigma_main

# préviens le main que le joueur est sur enigma
func _on_enigma_enigma_main():
	enigma_main.emit()


signal suite_enigma

# préviens le main que le joueur a décidé de passer à la suite
func _on_enigma_suite_enigma():
	suite_enigma.emit()
