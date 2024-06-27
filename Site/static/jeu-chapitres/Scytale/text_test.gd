extends RichTextLabel

var erreur = false;
var over = false;

signal completed;

@onready var message = ""
@onready var bloquer = false
func _input(event) : 
	if event.is_pressed() and not event.is_echo():
		var key_text = event.as_text();
		if not bloquer and test_en_cours :
			bloquer = true
			if message == "" :
				text = ""
			if over and key_text.to_lower() in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'] and not erreur and len(message) <= 18:
				message += key_text
				text += ajoute_espaces(message) + key_text
			bloquer = false

@onready var espaces = [0, 3, 4, 4, 5, 4, 4, 4, 4,
						1, 4, 4, 4, 4, 4, 4, 4, 4]
func ajoute_espaces(mess):
	var retour = ""
	if len(message) == 10 :
		retour +="\n"
	
	var espaces_a_rajouter = espaces[len(mess)-1]
	if mess[-1] == "m" : espaces_a_rajouter -= 1
	if mess[-1] == "" : espaces_a_rajouter -= 1
	if message[-1] == "i" : espaces_a_rajouter += 2
	for loop in range(espaces_a_rajouter) :
		retour += " "
	return retour


func _on_control_mouse_entered():
	print("over")
	over = true;

func _on_control_mouse_exited():
	print("not over")
	over = false;

@onready var test_en_cours = false
func _on_debut_tests():
	test_en_cours = true
