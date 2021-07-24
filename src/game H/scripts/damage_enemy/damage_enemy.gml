function damage_enemy(dmg){
	o_data_enemy.hp[| cursor_pos] -= dmg;
	if (o_data_enemy.hp[| cursor_pos] <= 0) {
		sound_machine(snd_enemy_win);
		var _cursor_pos = cursor_pos
		with (o_data_enemy) {
			ds_list_delete(Names, _cursor_pos);
			ds_list_delete(max_hp, _cursor_pos);
			ds_list_delete(hp, _cursor_pos);
			
			//Only works for up to 3 enemies
			for (var i = 0; i < ds_list_size(dead) - 1; i++) {
				if (dead[| i] == true) {
					if (i == 1 && _cursor_pos > 0) _cursor_pos++;
					else if (i == 0) _cursor_pos++;
				}
			}
			dead[| _cursor_pos] = true;
			
			o_menu_f_target.enemies = Names;

				   if (ds_list_size(Names) == 1) {
				 atk = atk_;
			} else if (ds_list_size(Names) == 2 &&
				Names[| 0] == Names[| 1]) {
					atk = atkT;
			} else if (ds_list_size(Names) == 3 &&
				Names[| 0] == Names[| 1] && Names[| 1] == Names[| 2]) {
					atk = atkT;
			} else {
				win();
			}
		}
	}
}