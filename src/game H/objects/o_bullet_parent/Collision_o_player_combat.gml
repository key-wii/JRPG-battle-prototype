with (other) {
	hp -= 1;
	image_index = (max_hp - hp);
	if (hp <= 0) room_restart();
}
sound_machine(snd_hurt);
with (obj_camera_controller) {
	shakeSteady = 7;
	plusShake = 4;
}
instance_destroy();