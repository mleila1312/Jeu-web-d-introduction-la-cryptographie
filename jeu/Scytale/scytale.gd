extends Control


@onready var corps = $AnimatedSprite2D
@onready var message = $RichTextLabel
@onready var bouton = $TextureButton
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

@onready var dialogues = {
	0 : "L    F    A    O     A    E    E     P    R
 C    S    R    N    T     E    T     R     B",
	1 : "[color=#bbbbbb] I    C    I            M    O    N         M
 E    S     S    A    G    E            ![/color]",
}

func affiche_message(i):
	message.text = dialogues[i]

func ouvrir() :
	show()
	message.hide()
	$Control.hide()	
	bouton.hide()
	
	corps.position.x = 197.143
	corps.position.y = 178.571
	corps.scale.x = 1.0
	corps.scale.y = 1.0
	corps.play("0")

func enroulement() :
	corps.play("9")
func vide():
	corps.play('0')
	message.text = ""
	bouton.hide()
func active_bouton():
	bouton.show()

func closeUp(i): #pos = (197.143 X, 178.571 Y)
				
	corps.position.x = -815.385
	corps.position.y = 652.308
	corps.scale.x = 5.0
	corps.scale.y = 5.0
	message.show()
	bouton.show()
	affiche_message(i)
	corps.play("full_enroule")


func _on_debut_tests():
	print("debut_tests : Control")
	$Control.show()
