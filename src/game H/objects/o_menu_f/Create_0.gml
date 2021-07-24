menu[0] = "ACT";
menu[1] = "CAST";
menu[2] = "ITEM";
emptyList = ds_list_create();

space = 256;
cursor_pos = 0;
selection = false;

x = room_width / 2;
y = room_height - (room_height / 16);