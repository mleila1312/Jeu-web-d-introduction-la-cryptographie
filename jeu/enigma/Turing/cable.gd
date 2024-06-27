extends Node2D

var swapped = [0, 0];

signal connect(swap1, swap2);

# Called when the node enters the scene tree for the first time.
func _ready():
	bad();

# convertit un caractère en nombre (A -> 1)
func string_to_int(char):
	if char != "":
		return char.to_ascii_buffer()[0] - 64

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# le carré devnient vert
func good():
	$Good.show();
	$Bad.hide();

# le carré devient rouge
func bad():
	$Bad.show();
	$Good.hide();

# si le bouton "connecté a été activé
func _on_connecter_pressed():
	# on vérifie que le caractère est bien une lettre 
	var yes = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
	
	# on récupère les lettres échangées 
	var text1 = $LineEdit.text;
	var text2 = $LineEdit2.text;
	
	# gestion des cas d'erreur ou incomplets
	var toconnect = true;
	if(text2 not in yes):
		$LineEdit2.text = ""
		bad();
		toconnect = false;
		swapped = [0, 0];
	if(text1 not in yes):
		$LineEdit.text = "";
		toconnect = false;
		swapped = [0, 0];
		bad();
	
	# si tout va bien, met à jour l'array swapped et renvoie un carré vert
	if toconnect:
		swapped = [string_to_int(text1), string_to_int(text2)];
		good();
	print(swapped);
	
	# prévient $Cables que deux lettres ont été échangées
	connect.emit(string_to_int(text1), string_to_int(text2));


# réinitialise le connecteur
func reset():
	swapped = [0, 0];
	bad();
	$LineEdit.text = "";
	$LineEdit2.text = "";


# dès qu'une case est modifiée -> rouge

func _on_line_edit_text_changed(new_text):
	bad();


func _on_line_edit_2_text_changed(new_text):
	bad();


# pour reset
func _on_cables_reset():
	reset();
