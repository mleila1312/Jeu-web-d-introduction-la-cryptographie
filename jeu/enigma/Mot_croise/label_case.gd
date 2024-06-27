extends Label

var erreur = false;
var over = false;
var complete = false;

signal completed;

# pour écrire sur le label
func _input(event) : 
	var key_text = event.as_text();
	if key_text.to_lower() in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'] and over and not complete and not erreur and len(text) == 0:
			text += key_text
			if text == get_parent().correct:
				complete = true;
				emit_signal("completed")
			else:
				erreur = true;
				await get_tree().create_timer(1.0).timeout;
				text = "";
				erreur = false;

# permet l'écriture si la souris est sur la case
func _on_control_mouse_entered():
	over = true;

func _on_control_mouse_exited():
	over = false;
