if (keyBoard && state != player_state_ufo) {
	sprite_index = spr_cow_ufo;	
	state = player_state_ufo;
	with (other) {
		instance_destroy();	
	}
}