if (!wait) {
	if (up) yy += .5;
	else yy -= .5;
	
	if (yy == 15 || yy == -15) {
		wait = true;
		alarm_set(0, 6);
	}
}