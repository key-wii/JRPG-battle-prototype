emptyList = ds_list_create();

var choice = o_controller_f.cursor[menuIndex];
if (global.win) var data = o_data_enemy.actsWin[| choice];
else if (menuIndex == 0) var data = o_data_enemy.acts[| choice];
else if (menuIndex == 1) var data = o_data_spells.casts[| choice];
else if (menuIndex == 2) var data = o_data_inventory.items[| choice];
if (data[6]) {
	enemies = ds_list_create();
	ds_list_add(enemies, "You");
} else enemies = o_data_enemy.Names;

cursor_pos = 0;
//space = 300;
selection = false;

x = room_width / 2;
y = room_height - (room_height / 1.9);