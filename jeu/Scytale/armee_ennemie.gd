extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func montrer() :
	visible = true
	$AnimatedSprite2D.play("pop_up")

func _on_anim_finie():
	for loop in range(60) :
		scale.x += 0.05
		scale.y += 0.05
		await get_tree().create_timer(0.05).timeout
