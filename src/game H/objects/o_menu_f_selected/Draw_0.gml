/// @description
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_f);
draw_set_color(o_controller_f.UIcolor);

draw_9slice(box_left, box_top, box_w, box_h, spr_box, 0);

textHeight = string_height(fullText) + 2;

var tLen = string_length(fullText);
if (charCount < tLen + 8) {
	if (textSound mod 7 == 0 && charCount < tLen) sound_machine(snd_text);
	textSound += 1;
	charCount += .5;
}
if (variable_instance_exists(id, "text")) {
	textPart[0] = string_copy(text[0], 1, ceil(charCount));
	textLen[0] = string_length(textPart[0]);
	if (array_length(text) > 1 && charCount >= textLen[0]) {
		textPart[1] = string_copy(text[1], 1, ceil(charCount - textLen[0]));
		textLen[1] = string_length(textPart[1]);
		if (array_length(text) > 2 && charCount >= textLen[1]) {
			textPart[2] = string_copy(text[2], 1, ceil(charCount - textLen[0] - textLen[1]));
		}
	}
} else {
	text[0] = "Why the fuck is the text variable not set properly I fucking hate you gamemaker kill yourself";
	fullText = text[0];
	textPart[0] = string_copy(text[0], 1, ceil(charCount));
	textLen[0] = string_length(textPart[0]);
}
var xxx = x;
var yyy = y + 15;
if (array_length(text) <= 2) yyy += 40;
if (array_length(text) <= 1) yyy += 40;
for (var i = 0; i < array_length(textPart); i++)
	draw_text(xxx, yyy + textHeight * (i + 1), textPart[i]);