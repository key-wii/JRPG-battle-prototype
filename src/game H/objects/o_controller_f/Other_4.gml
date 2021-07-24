global.win = false;
max_hp = 10;
hp = max_hp;
shrunk = false;

//save last position of cursor for
//	1: ACT
//	2: CAST
//	3: ITEM
cursor[0] = 0;
cursor[1] = 0;
cursor[2] = 0;

UIcolor = make_color_rgb(150, 223, 244); //light blue
UIselectedColor = make_color_rgb(193, 239, 95); //light green
UIcolorAlt = $f662d1; //pink
//UIselectedColor = make_color_rgb(213, 227, 172); //almost white green
//UIselectedColor = make_color_rgb(248, 157, 49); //orange