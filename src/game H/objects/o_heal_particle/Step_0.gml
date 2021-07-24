y -= spd;

if (w) {
	x += 2;
	wiggle += 2;
	if (wiggle > w_max) {
		wiggle = 0;
		w = false;
	}
} else {
	x -= 2;
	wiggle -= 2;
	if (wiggle < -w_max) {
		wiggle = 0;
		w = true;
	}
}