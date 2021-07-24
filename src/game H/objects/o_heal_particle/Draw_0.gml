draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_f_desc);
draw_set_color(c_lime);

if (heal == .5) {
	draw_text(x - 10, y, "+");
	var xx = string_width("+") - 14;
	draw_set_font(fnt_menu_f_smallest);
	draw_text(x + xx, y - 16, "1");
	draw_text(x + xx, y + 0,  "—");
	draw_text(x + xx, y + 16, "2");
} else draw_text(x, y, "+" + string(heal));

//string_replace_all(string_format(heal, 1, 0), " ", "")