var confirm;
confirm = max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space), 0);
if (confirm == 1) {
	var tLen = string_length(fullText);
	if (charCount >= tLen + 8) {
		instance_change(o_menu_f_combat, true);
	} else {
		charCount = tLen + 8;
		sound_machine(snd_text);
	}
}