function command_selected(options_list, reversing){
	if (!reversing) selection = true;
	if (reversing) sound_machine(snd_back);
	else sound_machine(snd_select); 
	with (obj_camera_controller) {
		var dir = -1;
		if (reversing) dir = 1;
		shakeMax = dir;
		plusShake = dir;
		noHor = true;
	}
	var new_menu = instance_create_layer(0, 0, "UI", o_menu_f_commands);
	if (!reversing) new_menu.menuIndex = cursor_pos;
	else new_menu.menuIndex = menuIndex;
	//new_menu.cursor_pos = o_controller_f.cursor[cursor_pos];
	
	if (ds_list_empty(options_list)) {
		var emptyChoice = array_create(2); emptyChoice[0] = ""; emptyChoice[1] = false; emptyChoice[7] = " - - -";
		with (new_menu) ds_list_add(commands, emptyChoice);
	} else {
		for (var i = 0; i < ds_list_size((options_list)); i++)
		with (new_menu) ds_list_add(commands, (options_list[| i]));
	}
	if (reversing) new_menu.cursor_pos = o_controller_f.cursor[menuIndex];
}