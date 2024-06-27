extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready():
	color_rect.color = Color(255,255,255,255)
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black" :
		on_transition_finished.emit()
	elif anim_name == "fade_to_normal":
		color_rect.visible = false

func apparition():
	color_rect.visible = true
	animation_player.play("fade_to_normal")


func disparition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
	
func cacher():
	color_rect.visible = false
