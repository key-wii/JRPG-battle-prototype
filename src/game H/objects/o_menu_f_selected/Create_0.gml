var choice = o_controller_f.cursor[menuIndex];
if (global.win) var data = o_data_enemy.actsWin[| choice];
else if (menuIndex == 0) var data = o_data_enemy.acts[| choice];
else if (menuIndex == 1) var data = o_data_spells.casts[| choice];
else if (menuIndex == 2) var data = o_data_inventory.items[| choice];
var times_used = data[3];
var text_data = data[2][| times_used];

var i = 0;
fullText = "";
for (i = 0; i < array_length(text_data); i++) {
	text[i] = text_data[i];
	fullText += text[i];
}
charCount = 0;
textSound = 0;

leaveFight = false;
x = room_width / 2;
y = room_height - (room_height / 1.9);

box_w = 1200;
box_h = 262;
box_left = x - (box_w / 2);
box_top = y + 45;

var len = ds_list_size(data[2]);
if (global.win && o_data_enemy.actsWin[| choice][3] < len - 1)			  o_data_enemy.actsWin[| choice][3]++;
else if (menuIndex == 0 && o_data_enemy.acts[| choice][3] < len - 1)	  o_data_enemy.acts[| choice][3]++;
else if (menuIndex == 1 && o_data_spells.casts[| choice][3] < len - 1)	  o_data_spells.casts[| choice][3]++;
else if (menuIndex == 2 && o_data_inventory.items[| choice][3] < len - 1) o_data_inventory.items[| choice][3]++;

//if (ds_list_size(o_data_enemy.Names) == 0) exit;
data[4](data[5]); //uses function data[4] using parameter data[5]