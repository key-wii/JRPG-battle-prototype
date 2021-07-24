draw_set_font(fnt_debug);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_halign(fa_left);
//if (!combat) draw_text(room_width - 120, 20, "COMBAT OFF");

if (!debug || !draw) exit;
draw_text(x + 42, y + 40 * .5, "DEBUG ON");
if (global.win) draw_text(room_width / 2 - string_length("win = true") / 2, room_height / 2, "win = true");

var n = 0;
var choice = cursor[n];
var data = o_data_enemy.acts[| choice];
var times_used = data[3];
var text_data = data[2][| times_used];
var i = 0;
var fullText = "";
for (i = 0; i < array_length(text_data); i++) {
	text[i] = text_data[i];
	fullText += text[i];
}

draw_text(x + 30, y + 40 * 1.5, "cursor[0] " + string(cursor[n]));
draw_text(x + 30, y + 40 * 2.5, "data " + string(o_data_enemy.acts[| choice]));
draw_text(x + 30, y + 40 * 3.5, "times_used " + string(data[3]));
draw_text(x + 30, y + 40 * 4.5, "text_data " + string(data[2][| times_used]));


n = 1;
choice = cursor[n];
data = o_data_spells.casts[| choice];
times_used = data[3];
text_data = data[2][| times_used];
i = 0;
fullText = "";
for (i = 0; i < array_length(text_data); i++) {
	text[i] = text_data[i];
	fullText += text[i];
}

draw_text(x + 30, y + 40 * 5.5, "cursor[1] " + string(cursor[n]));
draw_text(x + 30, y + 40 * 6.5, "data " + string(o_data_spells.casts[| choice]));
draw_text(x + 30, y + 40 * 7.5, "times_used " + string(data[3]));
draw_text(x + 30, y + 40 * 8.5, "text_data " + string(data[2][| times_used]));