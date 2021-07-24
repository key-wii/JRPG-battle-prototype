//movement
var spaceH = 6;
var spaceV = 7;

var xx = 0; var yy = 0;

//horizontal movement
var moveH = 0;
moveH -= max(keyboard_check_direct(vk_left), keyboard_check_direct(ord("A")), 0);
moveH += max(keyboard_check_direct(vk_right), keyboard_check_direct(ord("D")), 0);
if (moveH < 0 && !waitL) {
	if (x > box_left + sprite_width / 2 + spaceH) xx -= spd;
}
if (moveH > 0 && !waitR) {
	if (x < (box_left + box_w) - sprite_width / 2 - spaceH) xx += spd;
}

//vertical movement
var moveV = 0;
moveV -= max(keyboard_check_direct(vk_up), keyboard_check_direct(ord("W")), 0);
moveV += max(keyboard_check_direct(vk_down), keyboard_check_direct(ord("S")), 0);
if (moveV < 0 && !waitU) {
	if (y > box_top + sprite_width / 2 + spaceV) yy -= spd;
}
if (moveV > 0 && !waitD) {
	if (y < (box_top + box_h) - sprite_width / 2 - spaceV) yy += spd;
}

//diagonal movement
if (xx != 0 and yy != 0) {
	xx *= .707;
	yy *= .707;
}

//move
x += xx;
y += yy;

/*check_movement_pri();
if (pri_keyH > 0) {
    if (global.pri_keyH == global.pri_lf)
		if (x > box_left + sprite_width / 2 + spaceH && !waitL) x -= 3;
    if (global.pri_keyH == global.pri_rt)
		if (x < (box_left + box_w) - sprite_width / 2 - spaceH && !waitR) x += 3;
}
if (pri_keyV > 0) {
    if (global.pri_keyV == global.pri_up)
		if (y > box_top + sprite_width / 2 + spaceV && !waitU) y -= 3;
    if (global.pri_keyV == global.pri_dn) 
		if (y < (box_top + box_h) - sprite_width / 2 - spaceV && !waitD) y += 3;
}*/

if (!waitAll) exit;
//If player holds down button during transition, let them move AFTER they let go of button
if (waitL && max(keyboard_check_released(vk_left), keyboard_check_released(ord("A")), 0)) waitL = false;
if (waitR && max(keyboard_check_released(vk_right), keyboard_check_released(ord("D")), 0)) waitR = false;
if (waitU && max(keyboard_check_released(vk_up), keyboard_check_released(ord("W")), 0)) waitU = false;
if (waitD && max(keyboard_check_released(vk_down), keyboard_check_released(ord("S")), 0)) waitD = false;