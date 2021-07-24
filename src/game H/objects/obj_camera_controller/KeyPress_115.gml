/*if (!window_get_fullscreen()) {
	cameraWidth = 1350;
	cameraHeight = 900;
	camera_set_view_size (view_camera[2], cameraWidth, cameraHeight);
	
	//Display
	displayScale = cameraWidth / 1200;
	displayWidth = cameraWidth * displayScale;
	displayHeight = cameraHeight * displayScale;
	window_set_fullscreen(true);
	
	window_set_size(displayWidth, displayHeight);
	surface_resize(application_surface, cameraWidth, cameraHeight);
	
	//GUI
	display_set_gui_size(cameraWidth, cameraHeight);
} else {
	cameraWidth = 1200;
	cameraHeight = 800;
	camera_set_view_size (view_camera[2], cameraWidth, cameraHeight);
	
	//Display
	displayScale = cameraWidth / 1200;
	displayWidth = cameraWidth * displayScale;
	displayHeight = cameraHeight * displayScale;
	window_set_fullscreen(false);
	
	window_set_size(displayWidth, displayHeight);
	surface_resize(application_surface, cameraWidth, cameraHeight);
	
	//GUI
	display_set_gui_size(cameraWidth, cameraHeight);
}