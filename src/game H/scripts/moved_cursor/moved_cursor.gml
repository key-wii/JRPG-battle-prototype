function moved_cursor(cursor_pos, prev_pos) {
	sound_machine(snd_cursor);
	with (obj_camera_controller) {
		if (cursor_pos > prev_pos) shakeMax = 1;
		else if (cursor_pos < prev_pos) shakeMax = -1;
		plusShake = 0;
		noVer = true;
	}
}