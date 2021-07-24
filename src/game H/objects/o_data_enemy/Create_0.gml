yy = 0;
up = false;
wait = false;

Names = ds_list_create();
Names_copy = ds_list_create();
max_hp = ds_list_create();
hp = ds_list_create();
wet = ds_list_create();
sprites = ds_list_create();
sprites_win = ds_list_create();
dead = ds_list_create();
/*max_hp[| 0] = 100;
hp[| 0] = max_hp[| 0];*/

x = room_width / 2;
y = 0 + (room_height / 3.75);