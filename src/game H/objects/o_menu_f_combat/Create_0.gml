x = room_width / 2;
y = room_height - (room_height / 1.9);

var currentAtk = attack_picker(o_data_enemy.atkOrder, o_data_enemy.turn);
timeline_index = o_data_enemy.atk[currentAtk][0];
timeline_running = true;
box_w = o_data_enemy.atk[currentAtk][1];
box_h = o_data_enemy.atk[currentAtk][2];
box_left = o_data_enemy.atk[currentAtk][3];
box_top = o_data_enemy.atk[currentAtk][4];
duration = o_data_enemy.atk[currentAtk][5];
if (!o_controller_f.combat) duration = 4;
alarm_set(10, duration);

var player = instance_create_layer(x, box_top + box_h / 2, "Player", o_player_combat);
player.box_left = box_left;
player.box_top = box_top;
player.box_w = box_w;
player.box_h = box_h;

temp_box_w = 32;
temp_box_h = 32;
temp_box_left = x - (temp_box_w / 2);
temp_box_top = y + 45 + ((box_h - temp_box_h) / 2);
alarm_set(0, 1);

o_data_enemy.turn++;