temp_box_w = clamp(temp_box_w - 12, 0, box_w);
temp_box_h = clamp(temp_box_h - 12, 0, box_h);
temp_box_left = x - (temp_box_w / 2);
temp_box_top = y + 45 + ((box_h - temp_box_h) / 2);

if (temp_box_w == 0 &&
	temp_box_h == 0 &&
	temp_box_w == 0 &&
	temp_box_w == 0) {
		with (o_menu_f) {
			selection = false;
			
			var text_data = o_data_enemy.flavor_text;
			var i = 0;
			fullText = "";
			for (i = 0; i < array_length(text_data); i++) {
				text[i] = text_data[i];
				fullText += text[i];
			}
			charCount = 0;
			textSound = 0;
			
			draw_flavortext = false;
			alarm_set(0, 1);
		}
		if (!global.win) heal_player(.5);
		o_controller_f.shrunk = false;
		instance_destroy();
}
alarm_set(11, 1);