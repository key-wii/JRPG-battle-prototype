//Prevents glitch of black bars getting miscolored due to being drawn over 
/*var xx = camera_get_view_x(0);
var yy = camera_get_view_y(0);
draw_set_color(c_black);
draw_rectangle(xx - 600, yy - 600, xx + cameraWidth + 600, yy + cameraHeight + 600, false);
draw_set_color(c_white);