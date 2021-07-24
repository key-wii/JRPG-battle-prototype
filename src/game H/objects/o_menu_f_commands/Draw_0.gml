/// @description Draw UI buttons and cursor arrow
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_f);

var box_w = 1200;
var box_h = 260;
draw_9slice(x - (box_w / 2), y + 45, box_w, box_h, spr_box, 0);

var yspace = 80;
var yy = 95;
for (var button = 0; button < ds_list_size(commands); button++) {
	var xspace = space;
	if (button mod 2 == 0) xspace = -space;
	/*if (cursor_pos == button) draw_set_color(o_controller_f.UIselectedColor);
	else */draw_set_color(o_controller_f.UIcolor);
	draw_text(x + xspace, y + (floor(button / 2)) * yspace + yy, string(commands[| button][0]));
}

var cursor_space = space;
if (cursor_pos mod 2 == 0) cursor_space = -space;
draw_sprite(sprite_index, 0, x + cursor_space - (string_length(string(commands[| cursor_pos][0])) * 20), y + (floor(cursor_pos / 2)) * yspace + yy);


var box_h2 = 80;
draw_9slice(x - (box_w / 2), box_h + 10 + y + 45, box_w, box_h2, spr_box, 0);

draw_set_halign(fa_left);
draw_set_font(fnt_menu_f_desc);
draw_set_color(o_controller_f.UIcolorAlt);
draw_text(x - (space * 1.25), box_h + y + yspace + 15, string(commands[| cursor_pos][7]));