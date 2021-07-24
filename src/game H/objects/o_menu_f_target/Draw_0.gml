/// @description Draw UI buttons and cursor arrow
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_f);

var box_w = 1200;
var box_h = 260;
draw_9slice(x - (box_w / 2), y + 45, box_w, box_h, spr_box, 0);

var enemyNum = ds_list_size(enemies);
var yspace = 80;
var yy = 95;
if (enemyNum == 1) yy += yspace;
else if (enemyNum == 2) yy += yspace / 2;
for (var button = 0; button < enemyNum; button++) {
	/*if (cursor_pos == button) draw_set_color(o_controller_f.UIselectedColor);
	else */draw_set_color(o_controller_f.UIcolor);
	draw_text(x, y + button * yspace + yy, string(enemies[| button]));
}

draw_sprite(sprite_index, 0, x - (string_length(string(enemies[| cursor_pos])) * 20), y + cursor_pos * yspace + yy);