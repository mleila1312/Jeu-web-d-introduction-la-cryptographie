extends CanvasLayer

signal transitioned
signal finished

func transition():
	$AnimationPlayer.play("fade_to_black")
	print("fading to black")

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "fade_to_black"):
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
	if(anim_name == "fade_to_normal"):
		emit_signal("finished")

func _on_transition_screen_transitioned():
	get_node("../bureau").hide()
	get_node("../dialogue").entrer()


func _on_transition_screen_finished():
	$TransitionScreen.hide()