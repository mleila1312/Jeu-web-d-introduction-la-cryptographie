extends Control

signal finiii
@onready var fini = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$label_fin.hide()

func _input(event) : 
	if working and over :
		if event.is_pressed() and not event.is_echo():
			if $Label.text == ">>" : $Label.text = ""
			if not fini :
				var key_text = event.as_text()
				if over and key_text.to_lower() in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'] :
					$Label.text += key_text.capitalize()
					test()

@onready var iter = 0
@onready var max_iter = 30
func test() :
	print(iter)
	if $Label.text != "DRANAC" and iter < max_iter :
		iter += 1
		await get_tree().create_timer(0.5).timeout
		test()
	elif iter == max_iter :
		$Label.text = "essaie encore !"
		await get_tree().create_timer(1.0).timeout
		$Label.text = ""
		iter = 0
	elif $Label.text == "DRANAC" :
		$Label.text = "Bravo !"
		iter = max_iter + 1
		fini = true
		finiii.emit()
		$Label.hide()
		$label_fin.show()



@onready var over = false
func _on_mouse_entered():
	print("over")
	over = true
func _on_mouse_exited():
	print("not over")
	over = false

@onready var working = false
func _on_your_time_to_shine():
	print("Machine : DRANAC")
	$Label.text = ">>"
	visible = true
	working = true
