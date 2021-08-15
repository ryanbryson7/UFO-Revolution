// Closing Transition
//if (instance_exists(obj_transition)) {
//	with(obj_transition) {
//		transitionSign = 1;	
//		while (image_alpha < 1) {
//			image_alpha += (transitionSign * 0.01);
//			image_alpha = clamp(image_alpha, 0, 1);
//		}
//	}
//}
if (room == room_intro) {
	playerOneHealth = 3;
	playerOneScore = 0;
	playerTwoHealth = 3;
	playerTwoScore = 0;
}