//if (global.unpausing) exit;

//Camera
normal = true;
cameraX = 0;
cameraY = 0;
/*if (instance_exists(obj_camera_midpoint_target))
	target = obj_camera_midpoint_target;
if (instance_exists(obj_camera_miniboss_target))
	target = obj_camera_miniboss_target;
if (instance_exists(obj_camera_miniboss_target_tutorial))
	target = obj_camera_miniboss_target_tutorial;
else target = obj_tank_pilot;*/

cameraWidth = 1360;
cameraHeight = 765;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size (view_camera[2], cameraWidth, cameraHeight);

//Display
displayScale = cameraWidth / 1360;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth, displayHeight);
surface_resize(application_surface, cameraWidth, cameraHeight);

//GUI
display_set_gui_size(cameraWidth, cameraHeight);