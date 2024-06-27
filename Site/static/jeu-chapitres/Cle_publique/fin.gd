extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	$Boite_dialogue_fin.hide()
	$Boite_dialogue_fin.dialogue([0, 0])
	$Backrivest.hide()

func entrer():
	self.show()
	$Boite_dialogue_fin.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var state = 0

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if(state == 0 and self.is_visible_in_tree()):
			if($Boite_dialogue_fin.incr_dialogue()):
				state = 1
				$MegaRivestDetoure.hide()
				$Backrivest.show()
				$Boite_dialogue_fin/text.text = ""
				$Timer.wait_time = 4
				$Timer2.wait_time = 4 - 1
				$Timer3.wait_time = 4 - 2
				$Timer4.wait_time = 4 - 3
				$Timer.start()
				$Timer2.start()
				$Timer3.start()
				$Timer4.start()
		elif(state == 2):
			if($Boite_dialogue_fin.incr_dialogue()):
				get_tree().quit()

func _on_timer_timeout():
	$MegaRivestDetoure.show()
	$Backrivest.hide()
	$Boite_dialogue_fin.incr_dialogue()
	state = 2


func _on_timer_2_timeout():
	$Boite_dialogue_fin/text.text = ". . ."


func _on_timer_3_timeout():
	$Boite_dialogue_fin/text.text = ". ."


func _on_timer_4_timeout():
	$Boite_dialogue_fin/text.text = ". "
