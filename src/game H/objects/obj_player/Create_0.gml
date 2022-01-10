image_speed = 0;

can_move = true;
just_moved = false;
burst = false;
touching_wall = false;
alarm_reset = true;

topSpeed_default = 2;
burstSpeed_default = 3;
topSpeed = topSpeed_default;
burstSpeed = burstSpeed_default;

enum Hdir {
	left, right, na
}
enum Vdir {
	up, down, na
}

last_Hdir = Hdir.na;
last_Vdir = Vdir.na;

just_stopped = true;
xMove = 0;
yMove = 0;

last_x = x;
last_y = y;