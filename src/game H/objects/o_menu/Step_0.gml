var move = 0;
move -= max(keyboard_check_pressed(vk_left), keyboard_check_pressed(ord("A")), 0);
move += max(keyboard_check_pressed(vk_right), keyboard_check_pressed(ord("D")), 0);

if (move != 0 && !selection) {
	var prev_pos = cursor_pos;
	cursor_pos += move;
	if (cursor_pos < 0) cursor_pos = array_length(menu) - 1;
	if (cursor_pos > array_length(menu) - 1) cursor_pos = 0;
	if (prev_pos != cursor_pos) moved_cursor(cursor_pos, prev_pos);
}

var confirm;
confirm = max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), 0);
if (confirm == 1 && !selection) {
	var enemy = o_data_enemy_test1;
	switch (cursor_pos) {
		case 0: {
			var enemy = o_data_enemy_test1;
			break;
		}
		case 1: {
			var enemy = o_data_enemy_test2;
			break;
		}
		case 2: {
			var enemy = o_data_enemy_test3;
			break;
		}
	}
	instance_create_layer(0, 0, "Combat_behind", enemy);
	with (o_controller) instance_change(o_controller_f, true);
	room_goto(room_fight);
	instance_destroy();
}