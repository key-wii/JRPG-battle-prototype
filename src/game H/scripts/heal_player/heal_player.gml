function heal_player(heal){
	sound_machine(snd_heal);
	var part = instance_create_layer(room_width / 2, room_height - room_height / 3.5, "UI_front", o_heal_particle);
	part.heal = heal;
	with(o_controller_f) {
		hp += heal;
		if (hp > max_hp) hp = max_hp;
	}
}