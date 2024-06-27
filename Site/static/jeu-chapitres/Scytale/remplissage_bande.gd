extends Control

@onready var over = false
@onready var message = ""

signal case1
signal case2
signal case3
signal case4
signal case5
signal case6
signal case7
signal case8
signal case9
signal case10
signal case11
signal case12
signal case13
signal case14
signal case15
signal case16
signal case17
signal case18
signal reset
signal papier_deplie

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event) : 
	if event.is_pressed() and not event.is_echo():
		var key_text = event.as_text();
		if test_en_cours :
			if over and key_text.to_lower() in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'] and len(message) <= 18:
				message += key_text
				match len(message) :
					1 : case1.emit(key_text)
					2 : case2.emit(key_text)
					3 : case3.emit(key_text)
					4 : case4.emit(key_text)
					5 : case5.emit(key_text)
					6 : case6.emit(key_text)
					7 : case7.emit(key_text)
					8 : case8.emit(key_text)
					9 : case9.emit(key_text)
					10 : case10.emit(key_text)
					11 : case11.emit(key_text)
					12 : case12.emit(key_text)
					13 : case13.emit(key_text)
					14 : case14.emit(key_text)
					15 : case15.emit(key_text)
					16 : case16.emit(key_text)
					17 : case17.emit(key_text)
					18 : case18.emit(key_text)
				
				

func _on_control_mouse_entered():
	print("over")
	over = true;

func _on_control_mouse_exited():
	print("not over")
	over = false;

@onready var test_en_cours = false
func _on_debut_tests():
	test_en_cours = true

func _on_fin_tests():
	test_en_cours = false
	papier_deplie.emit(message)
	_on_reset()
	visible = false

func _on_reset():
	message = ""
	reset.emit()
