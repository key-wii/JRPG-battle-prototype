menu[0] = "ACT";
menu[1] = "CAST";
menu[2] = "ITEM";
emptyList = ds_list_create();

space = 256;
cursor_pos = 0;
selection = false;

x = room_width / 2;
y = room_height - (room_height / 16);




var text_data = o_data_enemy.flavor_text;
var i = 0;
fullText = "";
for (i = 0; i < array_length(text_data); i++) {
	text[i] = text_data[i];
	fullText += text[i];
}
charCount = 0;
textSound = 0;

box_w_ = 1010;
box_h_ = 170;
yy = room_height - (room_height / 1.9) + 92;
box_left = x - (box_w_ / 2);
box_top = yy + 45;