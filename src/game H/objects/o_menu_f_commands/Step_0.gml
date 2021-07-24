var move = 0;
move -= max(keyboard_check_pressed(vk_left), keyboard_check_pressed(ord("A")), 0);
move += max(keyboard_check_pressed(vk_right), keyboard_check_pressed(ord("D")), 0);

if (move != 0) {
	var prev_pos = cursor_pos;
	cursor_pos += move;
	if (cursor_pos < 0) cursor_pos = ds_list_size(commands) - 1;
	if (cursor_pos > ds_list_size(commands) - 1) cursor_pos = 0;
	if (prev_pos != cursor_pos) {
		o_controller_f.cursor[menuIndex] = cursor_pos;
		moved_cursor(cursor_pos, prev_pos);
	}
}

var cancel;
cancel = max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), keyboard_check_pressed(vk_shift), 0);
if (cancel == 1) {
	with (o_menu_f) selection = false;
	sound_machine(snd_back);
	with (obj_camera_controller) {
		shakeMax = 1;
		plusShake = 1;
		noHor = true;
	}
	instance_destroy();
	exit;
}

var confirm;
confirm = max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), 0);
if (confirm == 1) {
	//just screenshake if current option is unable to be selected
	if (!commands[| cursor_pos][1]) {
		audio_stop_sound(snd_buzzer);
		sound_machine(snd_buzzer);
		with (obj_camera_controller) {
			shakeSudden = 1;
			plusShake = 4;
		}
		exit;
	}
	sound_machine(snd_select);
	with (obj_camera_controller) {
		shakeMax = -1;
		plusShake = -1;
		noHor = true;
	}
	instance_change(o_menu_f_target, true);
}