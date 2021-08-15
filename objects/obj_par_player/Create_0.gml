sprite_index = spr_cow;
image_speed = 0;
image_index = 0;
playerHealth = 3;

customGravity = 0.5;
customGravityDefault = customGravity;
state = player_state_free;
collisionAbove = false;
collisionBelow = false;

localFrame = 0;

abducting = false;
ufoBeam = noone;
takingDamage = false;
damageTimeCounter = 0;
damageDuration = 2 * room_speed;
stunDuration = .10 * room_speed;

horizontalSpeed = 0;
verticalSpeed = 0;
jumpSpeed = -12;
walkSpeed  = 5;
maxSpeed = 13;
ufoSpeed = walkSpeed * .75;
abductedSpeed = .75;

playerScore = 0;
