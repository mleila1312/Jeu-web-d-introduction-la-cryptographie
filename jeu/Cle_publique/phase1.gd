extends Node2D

func set_zzz():
	$big_Z.text="Z";
	$big_Z.show();
	$middle_Z.text="Z";
	$middle_Z.show();
	$small_Z.text="Z";
	$small_Z.show();

func affiche_zzz(delta):
	var big_z_pos= $big_Z.position;
	var middle_z_pos = $middle_Z.position;
	var small_z_pos = $small_Z.position;
	$big_Z.position.x = fmod(big_z_pos.x+delta*90, 1150);
	$big_Z.position.y = fmod(big_z_pos.y+delta*90, 750);
	$middle_Z.position.x= fmod(middle_z_pos.x+delta*120, 1150);
	$middle_Z.position.y = fmod(middle_z_pos.y+delta*120, 750);
	$small_Z.position.x= fmod(small_z_pos.x+delta*150, 1150);
	$small_Z.position.y= fmod(small_z_pos.y+delta*150, 750);

func stop_beginning():
	$big_Z.hide();
	$middle_Z.hide();
	$small_Z.hide();

