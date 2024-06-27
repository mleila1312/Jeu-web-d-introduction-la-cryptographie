extends Node2D

# les lettres échangées par chaque connecteur
var swap12 = [0, 0];
var swap34 = [0, 0];
var swap56 = [0, 0];
var swapped = [0, 0, 0, 0, 0, 0];

signal reset;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# mets à jour les connecteurs 
func update():
	print("updating");
	swapped = [swap12[0], swap12[1], swap34[0], swap34[1], swap56[0], swap56[1]];
	
	# si deux lettres sont égales, c'est impossible, donc on reset tout 
	for i in range(6):
		for j in range(i+1, 6):
			if swapped[i] == swapped[j] and swapped[i] != 0:
				print("resetting...")
				reset.emit();
				swap12 = [0, 0];
				swap34 = [0, 0];
				swap56 = [0, 0];
				swapped = [0, 0, 0, 0, 0, 0, 0];
				
	print(swapped);


# pour connecter deux lettres

func _on_cable_connect(swap1, swap2):
	swap12[0] = swap1;
	swap12[1] = swap2;
	update();


func _on_cable_2_connect(swap1, swap2):
	swap34[0] = swap1;
	swap34[1] = swap2;
	update();


func _on_cable_3_connect(swap1, swap2):
	swap56[0] = swap1;
	swap56[1] = swap2;
	update();

signal retour

# previent enigma que le joueur veut revenir au menu principal
func _on_retour_pressed():
	retour.emit();


# renvoie la lettre échangée
func swap(lettre: int):
	if swapped[0] == lettre:
		return swapped[1]
	elif swapped[1] == lettre:
		return swapped[0]
	elif swapped[2] == lettre:
		return swapped[3]
	elif swapped[3] == lettre:
		return swapped[2]
	elif swapped[4] == lettre:
		return swapped[5]
	elif swapped[5] == lettre:
		return swapped[4]
	else:
		return lettre


signal aide_cables

# préviens enigma que le joueur veut une explication 
func _on_aide_rotors_pressed():
	aide_cables.emit()