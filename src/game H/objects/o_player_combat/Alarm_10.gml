image_xscale -= .3;
image_yscale -= .3;
if (image_xscale <= 0) {
	o_controller_f.hp = hp;
	instance_destroy();
}
alarm_set(10, 1);