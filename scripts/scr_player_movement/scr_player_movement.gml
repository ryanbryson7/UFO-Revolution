// Checks for nearby collisions with platforms
function player_collision() {
	var _collisionAbove = false;
	var _collisionBelow = false;
	
	// check if we're being abducted
	var _beamInst = instance_place(x, y - sprite_height + verticalSpeed, obj_ufo_beam);
	if (_beamInst != noone && !takingDamage) {
		if (_beamInst.creatorTeam == team.enemy) {
			verticalSpeed -= abductedSpeed;
			collisionBelow = true;
		}
	}
	
	var _inst;
	if (position_meeting(x, y - sprite_height, obj_platform)) {
		_collisionAbove = true;
	}
	else if (verticalSpeed < 0) {
		_inst = instance_place(x, y - sprite_height + verticalSpeed, obj_platform);
		if (_inst != noone) {
			_collisionAbove = true;
			y = _inst.bbox_top + sprite_height;
		}
	}
	
	if (position_meeting(x, y + 1, obj_platform)) {
		_collisionBelow = true;
	}
	else if (verticalSpeed > 0) {
		_inst = instance_place(x, y + sprite_height + verticalSpeed, obj_platform);
		if (_inst != noone) {
			_collisionBelow = true;
			y = _inst.bbox_top;
		}
	}
	
	// Create Return Array
	var	_collisionArray = [_collisionBelow, _collisionAbove];
	
	return _collisionArray;
}
	
function player_move_commit() {
	if (state == player_state_ufo) {
		customGravity = 0;
		if (collisionBelow) {
			if (keyDown) {
				verticalSpeed = 0;
			}
		}
		else if (collisionAbove) {
			if (keyUp) {
				verticalSpeed = 0;	
			}
		}
	}
	else {
		// Update gravity and speed based on collisions
		if (collisionBelow) {
			customGravity = 0;
			if (!keyUp) {
				verticalSpeed = 0;
			}
		}
		else {
			customGravity = customGravityDefault;
		}
		if (collisionAbove) {
			verticalSpeed = 0;
		}
	
		// Vertical Move Commit
		verticalSpeed += customGravity;
	}
	
	// Vertical Move Commit
	check_max_speed();
	y += verticalSpeed;
	
	// Horizontal Move Commit
	x += horizontalSpeed;
}

function check_taking_damage() {
	if (takingDamage) {
		if (takingDamage) {
			if (damageTimeCounter < damageDuration) {
				++damageTimeCounter;
			}
			else {
				damageTimeCounter = 0;
				takingDamage = false;
			}
		}
	}
	if (!takingDamage || (takingDamage && damageTimeCounter >= stunDuration)) {
		horizontalSpeed = lengthdir_x(inputMagnitude * walkSpeed, inputDirection);
	}
}