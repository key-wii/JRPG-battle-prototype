function win() {
	global.win = true;
	with (o_controller_f) {
		combat = false;
		cursor[0] = 0;
		cursor[1] = 0;
		cursor[2] = 0;
	}
	o_menu_f.cursor_pos = 0;
	with (o_data_enemy) Names = Names_copy;
}