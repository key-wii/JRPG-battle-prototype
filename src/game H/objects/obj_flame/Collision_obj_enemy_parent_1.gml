if (hit_shield != noone) exit;
if (global.tankpower == 0 ||
	(other.SH && other.shield != other.id) ||
	other.object_index == obj_enemy_tutorial_killer_s ||
	other.object_index == obj_enemy_tutorial_killer_b ||
	other.object_index == obj_enemy_tutorial_killer_r ||
	other.object_index == obj_enemy_tutorial_killer_slow ||
	other.object_index == obj_enemy_tutorial_killer_slow_b ||
	other.object_index == obj_enemy_tutorial_killer_slow_r ||
	other.object_index == obj_enemy_tutorial_dumdum) exit;
if (other.killer && other.dodges > 0) with (other) {
	with (wheels) {
		dodged = true;
		alarm_set(2, 1);
	}
	var particles = instance_create_layer(x, y, "Floor", obj_particles_killer_teleport);
	particles.dodge = true;
	alarm_set(4, 1);
	dodges--;
	sound_machine(snd_spawn_killer, x, y);
	if (global.flameKills > 0) {
		var controller_exists = instance_exists(controller);
		if (controller_exists)
			with (controller) {
				alarm_set(2, alarm_get(2) + 40);
				if (alarm_get(2) > 79) alarm_set(2, 79);
			}
		var boss_controller_exists = instance_exists(obj_boss1_controller);
		if (boss_controller_exists)
			with (obj_boss1_controller) {
				alarm_set(2, alarm_get(2) + 40);
				if (alarm_get(2) > 79) alarm_set(2, 79);
			}
	}
	exit;
}

var is_bomber = false;
if (other.object_index == obj_enemy_bomber) is_bomber = true;
var is_dizzy = false;
if (object_get_parent(other.object_index) == obj_enemy_dizzy_parent) is_dizzy = true;
var hhyper = hyper;
with(other) {
	var broken_shield = shield > 0 && shielding = true;
	if (broken_shield) {
		with(other) {
			shield = 0;
			shield_break = true;
		}
		sound_machine(snd_shield_break2, x, y);
		/*with (controller) {
			//I think this is suppose to be part of shield break sfx
			alarm_set(, 12);
		}*/
	}
	if (hit_count == 0 && (maxHp - damage > 10 ||
		(hydra && owner.headsLeft > 1) ||
		(slime && childrenLeft == 1)))
			sound_machine(snd_hit_miniboss, x, y);
	hit_count = 2;
	if (hit_count == 0) {
		sound_machine(snd_hit, x, y);
		hit_count = 2;
	}
	if (maxHp - damage > 10 && !npc) {
		var kill_X = instance_create_layer(x, y, "UI", obj_kill_X);
		kill_X.sprite_index = spr_kill_flame;
	}
	if (flameWeak) {
		damage += global.tankpower * 1.1;
		if (instance_exists(wheels)) wheels.damage += global.tankpower * 1.1;
	}/* else if (miniboss && hhyper && is_dizzy) {
		damage += global.tankpower / 1.5;
		wheels.damage += global.tankpower / 1.5;
	}*/ else {
		//main menu NPCs don't take damage
		if (npc) {
			spin = 372;
			charCount = 0;
			sprite_index = dead_sprite;
			alarm_set(9, 10);
			with (other) {
				var xx = lengthdir_x(140, direction);
				var yy = lengthdir_y(140, direction);
				var expl = instance_create_layer(x + xx, y + yy, "Explosions", obj_explosion_small);
				expl.direction = direction;
				expl.speed = 5;
			}
			/*if (!switchWait) {
				currentDialogue++;
				if (currentDialogue >= ds_list_size(dialogues)) currentDialogue = 0;
				text1 = dialogues[| currentDialogue][0];
				text2 = dialogues[| currentDialogue][1];
				text3 = dialogues[| currentDialogue][2];
				text4 = dialogues[| currentDialogue][3];
				text5 = dialogues[| currentDialogue][4];
				text = text1 + text2 + text3 + text4 + text5;
				textHeight = string_height(text) + 2;
		
															boxWidth = ceil(string_width(text1) * 2.075);
				if (string_width(text2) * 2.075 > boxWidth) boxWidth = ceil(string_width(text2) * 2.075);
				if (string_width(text3) * 2.075 > boxWidth) boxWidth = ceil(string_width(text3) * 2.075);
				if (string_width(text4) * 2.075 > boxWidth) boxWidth = ceil(string_width(text4) * 2.075);
				if (string_width(text5) * 2.075 > boxWidth) boxWidth = ceil(string_width(text5) * 2.075);
				boxWidth += 7;
				
				switchWait = true;
				alarm_set(5, 14);
			}*/
		} else {
			damage += global.tankpower;
			if (instance_exists(wheels)) wheels.damage += global.tankpower;
		}
	}
	if (is_bomber) {
		if (!flamed) dddir = other.direction;
		else dddir = (dddir + other.direction) / 2;
		/*if (instance_exists(obj_tank_pilot))
			flameBbboost = obj_tank_pilot.flame_dir;*/
	}
	if (slimeDead) exit;
	if (is_dizzy) {
		if (instance_exists(wheels)) wheels.radiusIncrease = 50;
		if (maxHp > 10) var big = true;
		else var big = false;
		//var mminiboss = miniboss;
		with (obj_tank_pilot) {
			if (!dir_changed || big /*|| mminiboss*/) {
				flame_dir *= -1;
				if (hhyper) direction += 60 * flame_dir;
				else direction += 40 * flame_dir;
				dir_changed = true;
				with (controller) alarm_set(3, 1);
			}
		}
	}
	burnt = 100;
	hitting = true;
	if (npc) exit;
	obj_camera.flameShake = screenShake * 7;
	alarm_set(8, 2);
	if (object_index != obj_boss_parent || !combo) {
		//kill
		if (damage >= maxHp) {
			//X mark on kill
			var kill_X = instance_create_layer(x, y, "UI", obj_kill_X);
			kill_X.sprite_index = spr_kill_flame;
			kill_X.image_xscale = 1.75;
			kill_X.image_yscale = 1.75;
			//slowdown on flame kills
			room_speed = 45;
			with(controller) alarm_set(5, 1);
			//reflecting bombers deals double damage (60) when using flame
			if (is_bomber) {
				ppow = 60;
				if (hitCount mod 3 == 0) sound_machine(snd_reflect_bomber, x, y);
				hitCount++;
				if (flamed) exit;
			}
			if (hydra || (slime && childrenLeft > 0)) exit;
			//set player's combo to true and gain a heal
			var player_exists = instance_exists(obj_tank_pilot);
			if (player_exists)
				with (obj_tank_pilot) {
					/*if (flame_dir > 0) direction -= 50;
					if (flame_dir < 0) direction += 50;
					flame_dir *= -1;*/
					combo = true;
					if (flameHeals < 0) flameHeals = 0;
					flameHeals += 10;
					var hp = 100 - damage;
					if (hp + flameHeals > 100) flameHeals = 100 - hp;
					if (flameHeals < 0) flameHeals = 0;
				}
			//Flame kills 10 to 99 boost speed
			var wheels_exist = instance_exists(obj_tank_move_flame);
			if (wheels_exist && global.flameKills > 9 && global.flameKills < 100) {
				obj_tank_move_flame.top_speed_boost += .006;
				global.flameSpeedBoost += .007;
			}
			//Flame kills 100 and above heal .1-ish damage
			if (player_exists && global.flameKills >= 100 && obj_tank_pilot.damage > 0) {
				obj_tank_pilot.damage -= (global.flameKills mod 10) * .05;
				if (obj_tank_pilot.spikesUnlocked) {
					 hp = 100 - obj_tank_pilot.damage;
					var hearts = floor(hp / 10);
					obj_tank_pilot.lastSpikes = hearts;
				}
			}
		}
	}
	if (is_bomber) flamed = true;
	if (slime && damage > maxHp) slimeDead = true;
}
var player_exists = instance_exists(obj_tank_pilot);
if (player_exists) {
	with (obj_tank_pilot) if (flameHeals < 0) flameHeals = 0;
}

var controller_exists = instance_exists(controller);
if (controller_exists) {
	with (controller) alarm_set(2, 79);
}
var boss_controller_exists = instance_exists(obj_boss1_controller);
if (boss_controller_exists) {
	with (obj_boss1_controller) alarm_set(2, 79);
}