menuIndex = o_menu_f.cursor_pos;
cursor_pos = o_controller_f.cursor[menuIndex];
commands = ds_list_create();

space = 300;
selection = false;

x = room_width / 2;
y = room_height - (room_height / 1.9);