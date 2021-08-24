/*if (!wait) {
	if (up) yy += .5;
	else yy -= .5;
	
	if (yy == 15 || yy == -15) {
		wait = true;
		alarm_set(0, 6);
	}
}*/

if (!wait) {
	if (up) wiggle_h += .5;
	else wiggle_h -= .5;
	
	if (wiggle_h == 30 || wiggle_h == 0) {
		wait = true;
		alarm_set(0, 6);
	}
}