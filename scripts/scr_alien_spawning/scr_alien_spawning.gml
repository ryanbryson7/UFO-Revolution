// Spawns one ground alien on top of a platform
function spawn_alien_ground(_platform){
	
	// Spawn alien on top of it
	var _inst = instance_create_layer(get_random_startingX(_platform), _platform.y, "Instances", obj_alien_ground);
		
	_inst.left_edge = _platform.bbox_left;
	_inst.right_edge = _platform.bbox_right;
	_inst.startingY = _platform.y;
}

// Spawns one ufo alien above a platform
function spawn_alien_ufo(_platform) {
	var _ufoX = _platform.x;   //get_random_startingX(_platform);
	var _ufoY = _platform.y - 68;   //(spr_ufo_beam.sprite_height + 2);  //It's janky, I know

	var _inst = instance_create_layer(_ufoX, _ufoY, "Instances", obj_alien_ufo);
	_inst.left_edge = _platform.bbox_left;
	_inst.right_edge = _platform.bbox_right;
	_inst.startingY = _ufoY;
	
}

// Gets a random x position between the ends of a platform
// @returns int
function get_random_startingX(_platform) {
	return irandom_range(_platform.bbox_left, _platform.bbox_right);
}