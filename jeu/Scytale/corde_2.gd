extends Node2D

@onready var corps = $AnimatedSprite2D


func pos_tendue():
	corps.position.x = 1322
	corps.position.y = 200
	corps.rotation = 0
	corps.scale.x = 1
	corps.scale.y = 1
	corps.play("tendue")
func pos_coupee():
	corps.position.x = 1298
	corps.position.y = 990
	corps.rotation = 93.8
	corps.scale.x = 0.8
	corps.scale.y = 0.8
	corps.play("coupee")

func _ready():
	hide()
	$TextureButton.show()
	pos_tendue()

func montrer():
	show()
func cacher():
	hide()

func coupee():
	$TextureButton.hide()
	pos_coupee()
