function player_state_free() {
	var _collisionArray = player_collision();
	collisionBelow = _collisionArray[0];
	collisionAbove = _collisionArray[1];
	
	// Set Speeds based on inputs
	if (keyUp && (collisionBelow || y > room_height - (ROOM_EDGE_FLOOR_BUFFER + 1))) {
		verticalSpeed += jumpSpeed;
	}
	
	check_taking_damage();
	
	// Move
	player_move_commit();
	
	// Sprite Animation/Orientation
	if (inputMagnitude != 0) {
		direction = inputDirection;
		player_animation(); 
	}
	else {
		image_index =  (sprite_get_number(sprite_index) / 2) * CARDINAL_DIRECTION;
	}	
}
	
function player_state_ufo() {
	var _collisionArray = player_collision();
	collisionBelow = _collisionArray[0];
	collisionAbove = _collisionArray[1];
	
	// Set Speeds based on inputs
	verticalSpeed = lengthdir_y(inputMagnitude * ufoSpeed, inputDirection);
	check_taking_damage();
	
	// Move
	player_move_commit();
	
	// Sprite Animation/Orientation
	if (inputMagnitude != 0) {
		direction = inputDirection;
		player_animation(); 
	}
	else {
		image_index = (sprite_get_number(sprite_index) / 2) * CARDINAL_DIRECTION;
	}	
	if (keyBoard) {
		state = player_state_free;
		instance_create_layer(x, y, "Instances", obj_ufo_empty);
		sprite_index = spr_cow;
		keyBoard = false;
	}
	
	if (keyAbduct) {
		state = player_state_abducting;	
	}
}

function player_state_abducting() {
	if (keyAbduct) {
		if (!abducting) {
			ufoBeam = instance_create_layer(x, y - 1, "Instances", obj_ufo_beam);
			ufoBeam.creatorTeam = team.player;
			ufoBeam.creator = self;
			abducting = true;
		}
	}
	else {
		instance_destroy(ufoBeam);
		abducting = false;
		state = player_state_ufo;	
	}
}

function player_state_dead() {
	
}