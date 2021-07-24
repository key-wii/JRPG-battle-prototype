var max_count = 30;
if (beat_wait <= 0 && beat_count < max_count) {
	beat_count++;
	var bc = beat_count mod 8;
	if (bc >= 4) {
			image_xscale += .02;
			image_yscale += .02;
	} else if (bc < 4) {
			image_xscale -= .02;
			image_yscale -= .02;
	}
} else {
	if (beat_count == 0) beat_wait--;
	else {
		beat_wait = 2;
		beat_count = 0;
	}
}
draw_self();