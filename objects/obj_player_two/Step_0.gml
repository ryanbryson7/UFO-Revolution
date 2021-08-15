keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyBoard = keyboard_check_pressed(vk_shift);
keyAbduct = keyboard_check(vk_control);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

script_execute(state);

x = clamp(x, 0 + ROOM_EDGE_WIDTH_BUFFER, room_width - ROOM_EDGE_WIDTH_BUFFER);
y = clamp(y, 0 + ROOM_EDGE_CEILING_BUFFER, room_height - ROOM_EDGE_FLOOR_BUFFER);

if (takingDamage) {
	image_alpha = .25; 	
}
else {
	image_alpha = 1;
}

if (playerHealth <= 0) {
	instance_destroy();
}