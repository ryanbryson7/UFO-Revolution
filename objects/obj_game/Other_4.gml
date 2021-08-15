// Opening Transition
//if (instance_exists(obj_transition)) {
//	with(obj_transition) {
//		transitionSign = -1;	
//		while (image_alpha > 0) {
//			image_alpha += (transitionSign * 0.1);
//			image_alpha = clamp(image_alpha, 0, .05);
//		}
//	}
//}

if (room == room_main) {
	
	spawningSquares = intialize_spawning_squares();

	initialize_room();
	
	// Create Player(s)
	instance_create_layer(30, 350, "Instances", obj_player_one);
	if (twoPlayerGame) {
		instance_create_layer(610, 350, "Instances", obj_player_two);	
	}
	
}