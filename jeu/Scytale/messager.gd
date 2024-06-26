extends Node2D

signal on_messager_entrance_finished

# Called when the node enters the scene tree for the first time.
@onready var animation_player = $AnimationPlayer
func _ready():
	animation_player.animation_finished.connect(_on_animation_finished)

func cacher():
	$corps.hide()
func montrer():
	$corps.show()

func arrive():
	$corps.play("run")
	$corps.show()
	$AnimationPlayer.play("approche")

func _on_animation_finished(_anim_name):
	$corps.play("idle")
	$corps.set_flip_h(true)
	on_messager_entrance_finished.emit()
