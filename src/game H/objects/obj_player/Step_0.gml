xMove = 0;
yMove = 0;

if (keyboard_check(ord("W")) && keyboard_check(ord("A")) && keyboard_check(ord("S")) ||
	keyboard_check(ord("W")) && keyboard_check(ord("A")) && keyboard_check(ord("D")) ||
	keyboard_check(ord("A")) && keyboard_check(ord("S")) && keyboard_check(ord("D")) ||
	keyboard_check(ord("A")) && keyboard_check(ord("S")) && keyboard_check(ord("D")) ||
	keyboard_check(ord("W")) && keyboard_check(ord("A")) && keyboard_check(ord("S"))
	&& keyboard_check(ord("D"))) {
		too_many_keys = true;
} else {
	too_many_keys = false;
}
if (keyboard_check(ord("W")) && keyboard_check(ord("S")) ||
	keyboard_check(ord("A")) && keyboard_check(ord("D"))) {
		opposing_keys = true;
} else {
	opposing_keys = false;
}

if (keyboard_check(ord("A")) && !too_many_keys && !opposing_keys && !place_meeting(x - topSpeed, y, obj_wall)) {
	//burst
	if (can_move && just_moved && last_Hdir = Hdir.right && !touching_wall && !place_meeting(x - burstSpeed, y, obj_wall)) {
			xMove -= -burstSpeed;
			moving = true; burst = true;
			last_Hdir = Hdir.left;
			just_stopped = false;
			if (alarm_reset) {
				//instance_create_layer(obj_tank_pilot.x, obj_tank_pilot.y, "Player", obj_burst);
				alarm_set(5, 10); alarm_reset = false;
			}
	//movement
	} else if (can_move) {
		xMove -= topSpeed;
		moving = true;
		just_moved = true;
		just_stopped = false;
		if (alarm_get(5) == 0) alarm_set(5, 95);
		last_Hdir = Hdir.left;
		alarm_set(4, 20);
	} 
}
if (keyboard_check(ord("D")) && !too_many_keys && !opposing_keys && !place_meeting(x + topSpeed, y, obj_wall)) {
	//burst
	if (can_move && just_moved && last_Hdir = Hdir.left && !touching_wall && !place_meeting(x + burstSpeed, y, obj_wall)) {
			xMove += burstSpeed;
			moving = true; burst = true;
			last_Hdir = Hdir.right;
			just_stopped = false;
			if (alarm_reset) {
				//instance_create_layer(obj_tank_pilot.x, obj_tank_pilot.y, "Player", obj_burst);
				alarm_set(5, 10); alarm_reset = false;
			}
	//movement
	} else if (can_move) {
		xMove += topSpeed;
		moving = true;
		just_moved = true;
		just_stopped = false;
		if (alarm_get(5) == 0) alarm_set(5, 95);
		last_Hdir = Hdir.right;
		alarm_set(4, 20);
	}
}
if (keyboard_check(ord("S")) && !too_many_keys && !opposing_keys && !place_meeting(x, y + topSpeed, obj_wall)) {
	//burst
	if (can_move && just_moved && last_Vdir = Vdir.up && !touching_wall && !place_meeting(x, y + burstSpeed, obj_wall)) {
			yMove += burstSpeed;
			moving = true; burst = true;
			last_Vdir = Vdir.down;
			just_stopped = false;
			if (alarm_reset) {
				//instance_create_layer(obj_tank_pilot.x, obj_tank_pilot.y, "Player", obj_burst);
				alarm_set(5, 10); alarm_reset = false;
			}
	//movement
	} else if (can_move) {
		yMove += topSpeed;
		moving = true;
		just_moved = true;
		just_stopped = false;
		if (alarm_get(5) == 0) alarm_set(5, 95);
		last_Vdir = Vdir.down;
		alarm_set(4, 20);
	} 
}
if (keyboard_check(ord("W")) && !too_many_keys && !opposing_keys && !place_meeting(x, y - topSpeed, obj_wall)) {
	//burst
	if (can_move && just_moved && last_Vdir = Vdir.down && !touching_wall && !place_meeting(x, y - burstSpeed, obj_wall)) {
			yMove -= -burstSpeed;
			moving = true; burst = true;
			last_Vdir = Vdir.up;
			just_stopped = false;
			if (alarm_reset) {
				//instance_create_layer(obj_tank_pilot.x, obj_tank_pilot.y, "Player", obj_burst);
				alarm_set(5, 10); alarm_reset = false;
			}
	//movement
	} else if (can_move) {
		yMove -= topSpeed;
		moving = true;
		just_moved = true;
		just_stopped = false;
		if (alarm_get(5) == 0) alarm_set(5, 95);
		last_Vdir = Vdir.up;
		alarm_set(4, 20);
	}
}

if (xMove != 0 && yMove != 0) {
	xMove *= .707;
	yMove *= .707;
}
x += xMove;
y += yMove;

//keep moving a bit 1 frame after stopping
if (just_stopped &&
	!keyboard_check(ord("A")) && !keyboard_check(ord("D")) &&
	!keyboard_check(ord("S")) && !keyboard_check(ord("W"))) {
		var sspd = topSpeed / 2 + 1;
			 if (last_Hdir == Hdir.left	&&	!place_meeting(x - sspd, y, obj_wall))	x -= sspd;
		else if (last_Hdir == Hdir.right && !place_meeting(x + sspd, y, obj_wall))	x += sspd;
			 if (last_Vdir == Vdir.up	&&	!place_meeting(x, y - sspd, obj_wall))	y -= sspd;
		else if (last_Vdir == Vdir.down &&	!place_meeting(x, y + sspd, obj_wall))	y += sspd;
		just_stopped = true;
}