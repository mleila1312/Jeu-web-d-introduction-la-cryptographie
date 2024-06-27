extends Node2D

@export var inventory: Inventory;

@onready var state = 0
@onready var state_finished = false
@onready var scytales_trouvees = 0
@onready var scytales_utilisees = 0
@onready var scytale_finale = 2
@onready var rubanCrypte_ouvert = false
@onready var rangement_sc_rose = -1
@onready var rangement_sc_bleu = -1


signal lance_dialogue
signal affiche_message
signal enlever_couteau_inventaire
signal ranger_couteau
signal ranger_ruban
signal couteau_rentre
signal couteau_sorti
signal attend_code
signal in_tente_0(nb)
signal in_tente_1
signal in_tente_2
signal ajout_scytale_rose_inv
signal ajout_scytale_bleu_inv 
signal enlever_scytale_rose_inventaire
signal enlever_scytale_bleu_inventaire
signal scytale_rose_sortie
signal scytale_bleu_sortie


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	cacher()

func cacher():
	$fleche.hide()
	$tente_0.hide()
	$ext_tente_0.hide()
	$ext_tente_1.hide()
	$ext_tente_2.hide()
	#penser à hide les autres tentes quand il y en aura


func debut_enigme() :
	visible = true
	emit_signal("in_tente_0", 1)
	lance_dialogue.emit()
	state_finished = true



func _on_lance_dialogue(): lance_dialogue.emit()
func _on_affiche_message(message): affiche_message.emit(message)



func _on_couteau_rentre(): couteau_rentre.emit()
func _on_couteau_sorti(): couteau_sorti.emit()
func _on_ruban_rentre(): rubanCrypte_ouvert = false
func _on_ruban_sorti(): rubanCrypte_ouvert = true

func _on_ranger_couteau():
	couteau_rentre.emit()
	ranger_couteau.emit()

func _on_enlever_couteau_inventaire(): enlever_couteau_inventaire.emit()



func _on_montrer_fleche():
	$fleche.show()

func _on_fleche_pressed(): #back to outside the tents
	$fleche.hide()
	$tente_0.hide()
	$tente_1.hide()
	$tente_2.hide()
	#penser à hide les intérieurs des autres tentes quand il y en aura
	
	$ext_tente_0.show()
	$ext_tente_1.show()
	$ext_tente_2.show()
	#penser à show les extérieurs des autres tentes quand il y en aura
	$scytale.hide()
	_on_affiche_message("")



func _on_ext_tente_0_pressed():
	cacher()
	emit_signal("in_tente_0", 2)
	
func _on_ext_tente_1_pressed():
	cacher()
	in_tente_1.emit()

func _on_ext_tente_2_pressed():
	cacher()
	in_tente_2.emit()



func _on_ajout_scytale_rose_inv():
	scytales_trouvees += 1
	rangement_sc_rose = scytales_trouvees-scytales_utilisees
	ajout_scytale_rose_inv.emit(rangement_sc_rose)

func _on_ajout_scytale_bleu_inv():
	scytales_trouvees += 1
	rangement_sc_bleu = scytales_trouvees-scytales_utilisees
	ajout_scytale_bleu_inv.emit(rangement_sc_bleu)

func _on_scytale_rose_sortie(): scytale_rose_sortie.emit()

func _on_scytale_bleu_sortie(): scytale_bleu_sortie.emit()

func _on_scytale_rose_zoom_clique():
	if rubanCrypte_ouvert :
		scytales_utilisees += 1
		enlever_scytale_rose_inventaire.emit(rangement_sc_rose)
		ranger_ruban.emit()
		if scytales_utilisees == scytale_finale :
			$scytale/AnimatedSprite2D.play("rose_8")
			$scytale/Control.affiche_bon_message()
			$fleche.hide()
			attend_code.emit()
		else :
			$scytale/AnimatedSprite2D.play("rose_8")
			$scytale/Control.affiche_mauvais_message()
			affiche_message.emit("Ce n'est pas la bonne taille de scytale ! Celle-ci est trop fine, on ne lit que du charabia...")
	else :
		$scytale.fermerScytale()
func _on_scytale_bleu_zoom_clique():
	if rubanCrypte_ouvert :
		scytales_utilisees += 1
		enlever_scytale_bleu_inventaire.emit(rangement_sc_bleu)
		ranger_ruban.emit()
		if scytales_utilisees == scytale_finale :
			$scytale/AnimatedSprite2D.play("bleu_8")
			$scytale/Control.affiche_bon_message()
			$fleche.hide()
			attend_code.emit()
		else :
			$scytale/AnimatedSprite2D.play("bleu_8")
			$scytale/Control.affiche_mauvais_message()
	else :
		$scytale.fermerScytale()


