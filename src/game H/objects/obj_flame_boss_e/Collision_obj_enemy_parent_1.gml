if (other.id == owner) exit;
var explode = false;
with(other) {
	var broken_shield = shield > 0 && shielding = true;
	if (broken_shield) {
		with(other) {
			shield = 0;
			shield_break = true;
		}
		audio_play_sound(snd_shield_break2, 0, 0);
		/*with (controller) {
			//I think this is suppose to be part of shield break sfx
			alarm_set(, 12);
		}*/
	}
	if (maxHp - damage > 10 && hit_count == 0)
		audio_play_sound(snd_hit_miniboss, 0, 0);
		hit_count = 2;
	if (hit_count == 0) {
		audio_play_sound(snd_hit, 0, 0);
		hit_count = 2;
	}
	if (maxHp - damage > 10) {
		var kill_X = instance_create_layer(x, y, "UI", obj_kill_X);
		kill_X.sprite_index = spr_kill_flame;
	}
	damage += 10;
	wheels.damage += 10;
	burnt = 100;
	obj_camera.flameShake = screenShake * 7;
	alarm_set(8, 2);
	if (damage >= maxHp) {
		with (other) {
			if (instance_exists(owner)) {
				with (owner) {
					combo = true;
					//boss can cheat death and heal too
					flameKills += 1;
					if (flameHeals < 0) flameHeals = 0;
					flameHeals += 10;
					var hp = maxHp - damage;
					if (hp + flameHeals > maxHp) flameHeals = maxHp - hp;
					if (flameHeals < 0) flameHeals = 0;
					alarm_set(7, 79);
					if (alarm_get(4) < 50) alarm_set(4, 3);
				}
				if (owner.spinSpd > 12 || owner.spinSpd < -12) {
					explode = true;
					room_speed = 40;
					with(controller) alarm_set(5, 1);
				}
			}
		}
		if (explode) {
			var explosion = instance_create_layer(x, y, "Explosions", obj_explosion_grenade_boss_e);
			explosion.sprite_index = spr_explosion_devil;
			explosion.image_alpha = .75;
			explosion.image_speed = .5;
			explosion.devil = true;
		}
		//X mark on kill
		var kill_X = instance_create_layer(x, y, "UI", obj_kill_X);
		kill_X.sprite_index = spr_kill_flame;
		kill_X.image_xscale = 1.75;
		kill_X.image_yscale = 1.75;
		//slowdown on flame kills
		if (room_speed > 45) {
			room_speed = 45;
			with(controller) alarm_set(5, 1);
		}
	}
}

if (instance_exists(owner))
	with (owner)
		if (alarm_get(7) > 0)
			alarm_set(7, 79);