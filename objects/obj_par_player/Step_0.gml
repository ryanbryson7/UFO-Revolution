// Get Player Inputs
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyBoard = keyboard_check_pressed(ord("E"));
keyAbduct = keyboard_check(vk_space);

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