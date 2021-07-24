/*var player_exists = instance_exists(obj_tank_pilot);
if (player_exists) {
	if (obj_tank_pilot.debug == false) exit;
} else exit;
if (normal) {
	normal = false;
	cameraX = 0;
	cameraY = 0;
	target = obj_tank_pilot;

	cameraWidth = 3648;
	cameraHeight = 3268;

	view_enabled = true;
	view_visible[2] = true;

	camera_set_view_size (view_camera[2], cameraWidth, cameraHeight);

	//Display
	displayScale = 1;
	displayWidth = cameraWidth * displayScale;
	displayHeight = cameraHeight * displayScale;

	window_set_size(displayWidth, displayHeight);
	surface_resize(application_surface, displayWidth, displayHeight);

	//GUI
	display_set_gui_size(cameraWidth, cameraHeight);

	alarm_set(0, 1);
} else {
	normal = true;
	cameraX = 0;
	cameraY = 0;
	target = obj_tank_pilot;

	cameraWidth = 1200;
	cameraHeight = 800;

	view_enabled = true;
	view_visible[2] = true;

	camera_set_view_size (view_camera[2], cameraWidth, cameraHeight);

	//Display
	displayScale = 1;
	displayWidth = cameraWidth * displayScale;
	displayHeight = cameraHeight * displayScale;

	window_set_size(displayWidth, displayHeight);
	surface_resize(application_surface, displayWidth, displayHeight);

	//GUI
	display_set_gui_size(cameraWidth, cameraHeight);

	alarm_set(0, 1);
}