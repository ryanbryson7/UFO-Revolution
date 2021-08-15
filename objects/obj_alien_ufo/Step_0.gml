event_inherited();
if (y == startingY) {
	if (abducting) {
		if (timer < abductionDuration) {
			if (timer == 0) {
				ufoBeam = instance_create_layer(x, y - 1, "Instances", obj_ufo_beam);
				ufoBeam.creatorTeam = team.enemy;
				ufoBeam.creator = self;
			}
			++timer;
		}
		else {
			instance_destroy(ufoBeam);
			timer = 0;
			abducting = false;
		}
	}
	else {
		if (timer < abductionCooldown) {
			++timer;
		}
		else {
			timer = 0;
			abducting = true;
		}
	}
}
else if (ufoBeam != noone) {
	abducting = false;
	timer = 0;
	instance_destroy(ufoBeam);
}