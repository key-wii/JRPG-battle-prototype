var move = 0;
move -= max(keyboard_check_pressed(vk_left), keyboard_check_pressed(ord("A")), 0);
move += max(keyboard_check_pressed(vk_right), keyboard_check_pressed(ord("D")), 0);

if (move != 0) {
	var prev_pos = cursor_pos;
	cursor_pos += move;
	if (cursor_pos < 0) cursor_pos = ds_list_size(enemies) - 1;
	if (cursor_pos > ds_list_size(enemies) - 1) cursor_pos = 0;
	if (prev_pos != cursor_pos) {
		//o_controller_f.cursor[menuIndex] = cursor_pos;
		moved_cursor(cursor_pos, prev_pos);
	}
}

var cancel;
cancel = max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), keyboard_check_pressed(vk_shift), 0);
if (cancel == 1) {
	sound_machine(snd_back);
	switch (menuIndex) {
		case 0: {
			//ACT
			if (global.win) command_selected(o_data_enemy.actsWin, true);
			else command_selected(o_data_enemy.acts, true);
			break;
		}
		case 1: {
			//CAST
			if (global.win) command_selected(emptyList, true);
			else command_selected(o_data_spells.casts, true);
			break;
		}
		case 2: {
			//ITEM
			if (global.win) command_selected(emptyList, true);
			else command_selected(o_data_inventory.items, true);
			break;
		}
	}
	instance_destroy();
	exit;
}

var confirm;
confirm = max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), 0);
if (confirm == 1) {
	//just screenshake if current option is unable to be selected
	/*if (!enemies[cursor_pos][1]) {
		with (obj_camera_controller) {
			shakeMax = 4;
			plusShake = 4;
		}
		exit;
	}*/
	sound_machine(snd_select);
	instance_change(o_menu_f_selected, true);
}