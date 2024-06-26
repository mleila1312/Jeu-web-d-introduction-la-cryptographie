extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_option_button_removed_rotor():
	$Label.text = "A → A"
	$Label2.text = "B → B"
	$Label3.text = "C → C"
	$Label4.text = "D → D"
	$Label5.text = "E → E"
	$Label6.text = "F → F"
	$Label7.text = "G → G"
	$Label8.text = "H → H"
	$Label9.text = "I → I"
	$Label10.text = "J → J"
	$Label11.text = "K → K"
	$Label12.text = "L → L"
	$Label13.text = "M → M"
	$Label14.text = "N → N"
	$Label15.text = "O → O"
	$Label16.text = "P → P"
	$Label17.text = "Q → Q"
	$Label18.text = "R → R"
	$Label19.text = "S → S"
	$Label20.text = "T → T"
	$Label21.text = "U → U"
	$Label22.text = "V → V"
	$Label23.text = "W → W"
	$Label24.text = "X → X"
	$Label25.text = "Y → Y"
	$Label26.text = "Z → Z"


func _on_option_button_rotor_moved():
	
	$Label.text = "A → %s" % [get_parent().int_to_string(get_parent().rotor[0])]
	$Label2.text = "B → %s" % [get_parent().int_to_string(get_parent().rotor[1])]
	$Label3.text = "C → %s" % [get_parent().int_to_string(get_parent().rotor[2])]
	$Label4.text = "D → %s" % [get_parent().int_to_string(get_parent().rotor[3])]
	$Label5.text = "E → %s" % [get_parent().int_to_string(get_parent().rotor[4])]
	$Label6.text = "F → %s" % [get_parent().int_to_string(get_parent().rotor[5])]
	$Label7.text = "G → %s" % [get_parent().int_to_string(get_parent().rotor[6])]
	$Label8.text = "H → %s" % [get_parent().int_to_string(get_parent().rotor[7])]
	$Label9.text = "I → %s" % [get_parent().int_to_string(get_parent().rotor[8])]
	$Label10.text = "J → %s" % [get_parent().int_to_string(get_parent().rotor[9])]
	$Label11.text = "K → %s" % [get_parent().int_to_string(get_parent().rotor[10])]
	$Label12.text = "L → %s" % [get_parent().int_to_string(get_parent().rotor[11])]
	$Label13.text = "M → %s" % [get_parent().int_to_string(get_parent().rotor[12])]
	$Label14.text = "N → %s" % [get_parent().int_to_string(get_parent().rotor[13])]
	$Label15.text = "O → %s" % [get_parent().int_to_string(get_parent().rotor[14])]
	$Label16.text = "P → %s" % [get_parent().int_to_string(get_parent().rotor[15])]
	$Label17.text = "Q → %s" % [get_parent().int_to_string(get_parent().rotor[16])]
	$Label18.text = "R → %s" % [get_parent().int_to_string(get_parent().rotor[17])]
	$Label19.text = "S → %s" % [get_parent().int_to_string(get_parent().rotor[18])]
	$Label20.text = "T → %s" % [get_parent().int_to_string(get_parent().rotor[19])]
	$Label21.text = "U → %s" % [get_parent().int_to_string(get_parent().rotor[20])]
	$Label22.text = "V → %s" % [get_parent().int_to_string(get_parent().rotor[21])]
	$Label23.text = "W → %s" % [get_parent().int_to_string(get_parent().rotor[22])]
	$Label24.text = "X → %s" % [get_parent().int_to_string(get_parent().rotor[23])]
	$Label25.text = "Y → %s" % [get_parent().int_to_string(get_parent().rotor[24])]
	$Label26.text = "Z → %s" % [get_parent().int_to_string(get_parent().rotor[25])]


func _on_option_button_added_rotor():
	$Label.text = "A → %s" % [get_parent().int_to_string(get_parent().rotor[0])]
	$Label2.text = "B → %s" % [get_parent().int_to_string(get_parent().rotor[1])]
	$Label3.text = "C → %s" % [get_parent().int_to_string(get_parent().rotor[2])]
	$Label4.text = "D → %s" % [get_parent().int_to_string(get_parent().rotor[3])]
	$Label5.text = "E → %s" % [get_parent().int_to_string(get_parent().rotor[4])]
	$Label6.text = "F → %s" % [get_parent().int_to_string(get_parent().rotor[5])]
	$Label7.text = "G → %s" % [get_parent().int_to_string(get_parent().rotor[6])]
	$Label8.text = "H → %s" % [get_parent().int_to_string(get_parent().rotor[7])]
	$Label9.text = "I → %s" % [get_parent().int_to_string(get_parent().rotor[8])]
	$Label10.text = "J → %s" % [get_parent().int_to_string(get_parent().rotor[9])]
	$Label11.text = "K → %s" % [get_parent().int_to_string(get_parent().rotor[10])]
	$Label12.text = "L → %s" % [get_parent().int_to_string(get_parent().rotor[11])]
	$Label13.text = "M → %s" % [get_parent().int_to_string(get_parent().rotor[12])]
	$Label14.text = "N → %s" % [get_parent().int_to_string(get_parent().rotor[13])]
	$Label15.text = "O → %s" % [get_parent().int_to_string(get_parent().rotor[14])]
	$Label16.text = "P → %s" % [get_parent().int_to_string(get_parent().rotor[15])]
	$Label17.text = "Q → %s" % [get_parent().int_to_string(get_parent().rotor[16])]
	$Label18.text = "R → %s" % [get_parent().int_to_string(get_parent().rotor[17])]
	$Label19.text = "S → %s" % [get_parent().int_to_string(get_parent().rotor[18])]
	$Label20.text = "T → %s" % [get_parent().int_to_string(get_parent().rotor[19])]
	$Label21.text = "U → %s" % [get_parent().int_to_string(get_parent().rotor[20])]
	$Label22.text = "V → %s" % [get_parent().int_to_string(get_parent().rotor[21])]
	$Label23.text = "W → %s" % [get_parent().int_to_string(get_parent().rotor[22])]
	$Label24.text = "X → %s" % [get_parent().int_to_string(get_parent().rotor[23])]
	$Label25.text = "Y → %s" % [get_parent().int_to_string(get_parent().rotor[24])]
	$Label26.text = "Z → %s" % [get_parent().int_to_string(get_parent().rotor[25])]
