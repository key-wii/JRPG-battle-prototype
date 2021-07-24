temp_box_w = clamp(temp_box_w + 6, 0, box_w);
temp_box_h = clamp(temp_box_h + 6, 0, box_h);
temp_box_left = x - (temp_box_w / 2);
temp_box_top = y + 45 + ((box_h - temp_box_h) / 2);

if (temp_box_w == box_w &&
	temp_box_h == box_h &&
	temp_box_w == box_w &&
	temp_box_w == box_w) exit;
alarm_set(0, 1);