extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var image = $Sprite2D

signal post_it_arrived

func _ready():
	image.hide()
	animation_player.animation_finished.connect(_on_animation_finished)

func cacher():
	image.hide()

func ouvrir():
	image.show()
	animation_player.play("pop-up")

func _on_animation_finished(_anim_name):
	post_it_arrived.emit()

