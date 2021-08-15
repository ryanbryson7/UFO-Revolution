event_inherited();

if (ufoBeam != noone) {
	instance_destroy(ufoBeam);	
}

instance_create_layer(x, y, "Instances", obj_ufo_empty);