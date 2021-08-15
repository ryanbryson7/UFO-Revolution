function player_animation() {
	var _framesPerAnimation = sprite_get_number(sprite_index) / 2;
	image_index = localFrame + (CARDINAL_DIRECTION * _framesPerAnimation);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	if (localFrame >= _framesPerAnimation) {
		localFrame -= _framesPerAnimation;
	}
}