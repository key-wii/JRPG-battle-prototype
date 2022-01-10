var hdir = 0;
var vdir = 0;
	 if (x > last_x && xMove < last_x) hdir += 1;
else if (x < last_x && xMove < last_x) hdir -= 1;
	 if (y > last_y && yMove < last_y) vdir += 1;
else if (y < last_y && yMove < last_y) vdir -= 1;
if (hdir == 1) {
	direction = 0;
		 if (vdir == 1) direction = 315;
	else if (vdir == -1) direction = 45;
} else if (hdir == -1) {
	direction = 180;
		 if (vdir == 1) direction = 225;
	else if (vdir == -1) direction = 135;
} else {
		 if (vdir == 1) direction = 270;
	else if (vdir == -1) direction = 90;
}
image_angle = direction;

last_x = x;
last_y = y;