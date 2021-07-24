var move = 0;
move -= max(keyboard_check_pressed(vk_left), keyboard_check_pressed(ord("A")), 0);
move += max(keyboard_check_pressed(vk_right), keyboard_check_pressed(ord("D")), 0);

if (move != 0 && !selection && !global.win) {
	var prev_pos = cursor_pos;
	cursor_pos += move;
	if (cursor_pos < 0) cursor_pos = array_length(menu) - 1;
	if (cursor_pos > array_length(menu) - 1) cursor_pos = 0;
	if (prev_pos != cursor_pos) moved_cursor(cursor_pos, prev_pos);
}

var confirm;
confirm = max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), 0);
if (confirm == 1 && !selection) {
	switch (cursor_pos) {
		case 0: {
			//ACT
			if (global.win) command_selected(o_data_enemy.actsWin, false);
			else command_selected(o_data_enemy.acts, false);
			break;
		}
		case 1: {
			//CAST
			if (global.win) command_selected(emptyList, false);
			else command_selected(o_data_spells.casts, false);
			break;
		}
		case 2: {
			//ITEM
			if (global.win) command_selected(emptyList, false);
			else command_selected(o_data_inventory.items, false);
			break;
		}
	}
}