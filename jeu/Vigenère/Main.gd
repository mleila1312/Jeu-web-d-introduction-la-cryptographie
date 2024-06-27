extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$MachineATaperZoom.hide();
	$ArrierePlanBureau.hide();
	$"CanvasLayer/Félicitations,VousAvezTrouvéLaCléDeChiffrement!".hide();
	$CanvasLayer/Coeur.hide();
	$LivreOuvertPoesie.hide();
	$"PeinturesZoom".hide();
	$CoffreZoom.hide();
	$CodeZoom.hide();
	$"CanvasLayer/MauvaiseCléDeChiffrement".hide()
	$CanvasLayer/MauvaisCodeAvecFond.hide()
	$VieuxCoffreOuvertAvecTresors.hide()
	$LettreZoom.hide()
	$"4Saisons/TextureButton".hide()
	$Area2D/TextureButton.hide()
	$CoffreZoom/TextureButton.hide()
	$MachineATaperZoom.hide();
	$"4Saisons".hide();
	$Area2D.hide();
	$VieuxCoffre.hide();
	$Bureau.hide();
	$ArrierePlan.hide();
	$ArrierePlanBureau.hide();
	$"PeinturesZoom".hide();
	$CanvasLayer.hide()
	$LivreOuvertPoesie.hide()
	$ZoomTabChiffrementExplication.hide()
	$"ZoomExplicationPpeChiffrementVigenère".hide()
	$"ScèneTransition".hide()
	$Chiffrement.hide()
	$"scènes_de_transition".hide()
	$Cryptanalyse.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	$MachineATaperZoom.show();
	$"4Saisons".hide();
	$Area2D/LivreOuvert.hide();
	$VieuxCoffre.hide();
	$Bureau.hide();
	$ArrierePlan.hide();
	$ArrierePlanBureau.show();
	$"PeinturesZoom".hide();
	
	




func _on_machine_a_taper_zoom_trouve():
	$CanvasLayer.show()
	$"CanvasLayer/Félicitations,VousAvezTrouvéLaCléDeChiffrement!".show();
	$MachineATaperZoom.hide();
	$CanvasLayer/Coeur.show();
	$ArrierePlanBureau.show()
	await get_tree().create_timer(3.0).timeout
	$"CanvasLayer/Félicitations,VousAvezTrouvéLaCléDeChiffrement!".hide();
	$MachineATaperZoom.hide();
	$CanvasLayer/Coeur.hide()
	$"4Saisons".show();
	$Area2D/LivreOuvert.show();
	$VieuxCoffre.show();
	$Bureau.show();
	$ArrierePlan.show();
	$ArrierePlanBureau.hide();
	$"4Saisons/TextureButton".show()
	$Area2D/TextureButton.show()
	$CoffreZoom/TextureButton.show()
	$CanvasLayer.show()
	$VieuxCoffre/TextureButton.show()
	
	


func _on_texture_button_pressed_livre_poesie():
	$LivreOuvertPoesie.show();
	$"4Saisons".hide();
	$Area2D/LivreOuvert.hide();
	$VieuxCoffre.hide();
	$Bureau.hide();
	$ArrierePlan.hide();
	$ArrierePlanBureau.show();


func _on_texture_button_pressed_retour():
	$LivreOuvertPoesie.hide();
	$"4Saisons".show();
	$Area2D/LivreOuvert.show();
	$VieuxCoffre.show();
	$Bureau.show();
	$ArrierePlan.show();
	$ArrierePlanBureau.hide();


func _on_texture_button_pressed_retour_machine_zoom():
	$MachineATaperZoom.hide();
	$"4Saisons".show();
	$Area2D/LivreOuvert.show();
	$VieuxCoffre.show();
	$Bureau.show();
	$ArrierePlan.show();
	$ArrierePlanBureau.hide();


func _on_texture_button_pressed_peintures_zoom():
	$"4Saisons".hide();
	$"PeinturesZoom".show();
	$Area2D/LivreOuvert.hide();
	$VieuxCoffre.hide();
	$Bureau.hide();
	$ArrierePlan.hide();


func _on_texture_button_pressed_retour_peintures():
	$PeinturesZoom.hide();
	$"4Saisons".show();
	$Area2D/LivreOuvert.show();
	$VieuxCoffre.show();
	$Bureau.show();
	$ArrierePlan.show();


func _on_texture_button_pressed_zoom_coffre():
	$"4Saisons".hide();
	$CoffreZoom.show();
	$Area2D/LivreOuvert.hide();
	$VieuxCoffre.hide();
	$Bureau.hide();
	$ArrierePlan.hide();


func _on_texture_button_pressed_zoom_coffre_retour():
	$CoffreZoom.hide();
	$"4Saisons".show();
	$Area2D/LivreOuvert.show();
	$VieuxCoffre.show();
	$Bureau.show();
	$ArrierePlan.show();


func _on_texture_button_2_pressed_zoom_code():
	$"4Saisons".hide();
	$CoffreZoom.hide();
	$Area2D/LivreOuvert.hide();
	$VieuxCoffre.hide();
	$Bureau.hide();
	$ArrierePlan.hide();
	$CodeZoom.show();


func _on_texture_button_pressed_zoom_code_retour():
	$CodeZoom.hide();
	$CoffreZoom.show();


func _on_machine_a_taper_zoom_pastrouve():
	$CanvasLayer.show()
	$"CanvasLayer/MauvaiseCléDeChiffrement".show();
	$MachineATaperZoom.hide();
	await get_tree().create_timer(3.0).timeout
	$"CanvasLayer/MauvaiseCléDeChiffrement".hide();
	$MachineATaperZoom.show();


func _on_code_zoom_pastrouve():
	$CodeZoom.hide(); # Replace with function body.
	$CanvasLayer/MauvaisCodeAvecFond.show()
	await get_tree().create_timer(3.0).timeout
	$CodeZoom.show();
	$CanvasLayer/MauvaisCodeAvecFond.hide()


func _on_code_zoom_trouve():
	$CodeZoom.hide()
	$VieuxCoffreOuvertAvecTresors.show()
	$VieuxCoffreOuvertAvecTresors/LightYellow.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow2.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow3.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton3.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton2.hide()
	$CoffreZoom.hide()

func _on_texture_button_2_pressed_zoom_lettre():
	$VieuxCoffreOuvertAvecTresors.hide()
	$LettreZoom.show()


func _on_texture_button_pressed_lettre_zoom_retour():
	$VieuxCoffreOuvertAvecTresors.show()
	$LettreZoom.hide()
	$VieuxCoffreOuvertAvecTresors/LightRed.hide()
	$VieuxCoffreOuvertAvecTresors/LightRed2.hide()
	$VieuxCoffreOuvertAvecTresors/LightRed3.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton2.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton3.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton4.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow.show()
	$VieuxCoffreOuvertAvecTresors/LightYellow2.show()
	$VieuxCoffreOuvertAvecTresors/LightYellow3.show()
	await get_tree().create_timer(1.0).timeout
	$VieuxCoffreOuvertAvecTresors.hide()
	$"ScèneTransition".show()
	await get_tree().create_timer(6.0).timeout
	$"ScèneTransition".hide()
	$Chiffrement.show()

func _on_texture_button_2_pressed_zoom_tabchiffr():
	$VieuxCoffreOuvertAvecTresors.hide()
	$ZoomTabChiffrementExplication.show()


func _on_texture_button_pressed_tabchiffr_retour():
	$VieuxCoffreOuvertAvecTresors.show()
	$ZoomTabChiffrementExplication.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton2.show()
	$VieuxCoffreOuvertAvecTresors/TextureButton3.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton4.hide()
	$VieuxCoffreOuvertAvecTresors/LightRed.hide()
	$VieuxCoffreOuvertAvecTresors/LightRed2.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow3.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow.show()
	$VieuxCoffreOuvertAvecTresors/LightYellow2.show()
	$VieuxCoffreOuvertAvecTresors/LightRed3.show()
	
func _on_texture_button_2_pressed_zoom_ppechiffr():
	$VieuxCoffreOuvertAvecTresors.hide()
	$"ZoomExplicationPpeChiffrementVigenère".show()


func _on_texture_button_pressed_ppechiffr_retour():
	$VieuxCoffreOuvertAvecTresors.show()
	$VieuxCoffreOuvertAvecTresors/TextureButton2.hide()
	$VieuxCoffreOuvertAvecTresors/TextureButton3.show()
	$VieuxCoffreOuvertAvecTresors/TextureButton4.hide()
	$VieuxCoffreOuvertAvecTresors/LightRed.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow2.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow3.hide()
	$VieuxCoffreOuvertAvecTresors/LightYellow.show()
	$VieuxCoffreOuvertAvecTresors/LightRed2.show()
	$VieuxCoffreOuvertAvecTresors/LightRed3.show()
	$"ZoomExplicationPpeChiffrementVigenère".hide()
	
	
