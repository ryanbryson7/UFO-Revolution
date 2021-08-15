event_inherited();

sprite_index = spr_alien_ufo;

pushback = 0;
abductionDuration = 4 * room_speed;
timer = irandom_range(0, 2 * room_speed);
abducting = choose(true, false);
abductionCooldown = 2 * room_speed;

ufoBeam = noone;

scoreGiven = 25;