// not in use
function check_movement_pri(){
	// Check input: Left
	if (max(keyboard_check_direct(vk_left), keyboard_check_direct(ord("A")), 0)) global.pri_lf = ++global.pri_keyH;
	if (max(keyboard_check_released(vk_left), keyboard_check_direct(ord("A")), 0)) global.pri_lf = 0;
	
	// Check input: Right
	if (max(keyboard_check_direct(vk_right), keyboard_check_direct(ord("D")), 0)) global.pri_rt = ++global.pri_keyH;
	if (max(keyboard_check_released(vk_right), keyboard_check_direct(ord("D")), 0)) global.pri_rt = 0;

	// Check input: Up
	if (max(keyboard_check_direct(vk_up), keyboard_check_direct(ord("W")), 0)) global.pri_up = ++global.pri_keyV;
	if (max(keyboard_check_released(vk_up), keyboard_check_direct(ord("W")), 0)) global.pri_up = 0;

	// Check input: Down
	if (max(keyboard_check_direct(vk_down), keyboard_check_direct(ord("S")), 0)) global.pri_dn = ++global.pri_keyV;
	if (max(keyboard_check_released(vk_down), keyboard_check_direct(ord("S")), 0)) global.pri_dn = 0;

	// Calculate most recent input
	pri_keyH = max(global.pri_lf, global.pri_rt, 0);
	pri_keyV = max(global.pri_up, global.pri_dn, 0);
}