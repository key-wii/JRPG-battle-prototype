max_hp = o_controller_f.max_hp;
hp = o_controller_f.hp;
image_index = (max_hp - hp);
image_speed = 0;

if (o_controller_f.shrunk) {
	sprite_index = spr_player_f_shrunk;
	spd = 1.5;
} else spd = 3;

beat_count = 0;
beat_wait = 10;

//If player is holding down button during transition, don't move
waitL = false;
waitR = false;
waitU = false;
waitD = false;
waitAll = true;
var moveH = 0;
moveH -= max(keyboard_check_direct(vk_left), keyboard_check_direct(ord("A")), 0);
moveH += max(keyboard_check_direct(vk_right), keyboard_check_direct(ord("D")), 0);
if (moveH < 0) {
	waitL = true;
}
if (moveH > 0) {
	waitR = true;
}
var moveV = 0;
moveV -= max(keyboard_check_direct(vk_up), keyboard_check_direct(ord("W")), 0);
moveV += max(keyboard_check_direct(vk_down), keyboard_check_direct(ord("S")), 0);
if (moveV < 0) {
	waitU = true;
}
if (moveV > 0) {
	waitD = true;
}
alarm_set(0, 20);