sprite_index = spr_platform;

	image_speed = 0;
// Randomly set platform variables (as long as it isn't the main ground platform)
if (image_xscale != 20) {
	image_index = irandom_range(0, image_number);

}
else {
	image_index = 0;
}
