//inside list of commands, each command is an array of
//	0: name (string),
//  1: can_use (bool),
//  2: list of text from act (strings in arrays), last index of each array is the fullText string,
//  3: times used (int)
//  4: what it does (function)
//  5: parameters for function in #4
//  6: targets_self (bool)
//  7: description of command (string)
casts = ds_list_create();

cast0[0] = "Poise";
cast0[1] = true;
	texts0 = ds_list_create();
		text00[0] = "You steel yourself";
		text00[1] = "1 HP healed";
		text01[0] = "You retain some grace";
		text01[1] = "1 HP healed";
	ds_list_add(texts0, text00, text01);
cast0[2] = texts0;
cast0[3] = 0;
cast0[4] = heal_player;
cast0[5] = 1;
cast0[6] = true;
cast0[7] = "+1 HP";

cast1[0] = "Splash";
cast1[1] = true;
	texts1 = ds_list_create();
		text10[0] = "You douse the enemy with water";
		text10[1] = "They are wet";
	ds_list_add(texts1, text10);
cast1[2] = texts1;
cast1[3] = 0;
cast1[4] = wet_enemy;
cast1[5] = undefined;
cast1[6] = false;
cast1[7] = "Wet";

cast2[0] = "Focus";
cast2[1] = true;
	texts2 = ds_list_create();
		text20[0] = "You close your eyes";
		text20[1] = "for the next attack";
	ds_list_add(texts2, text20);
cast2[2] = texts2;
cast2[3] = 0;
cast2[4] = shrink_player;
cast2[5] = undefined;
cast2[6] = true;
cast2[7] = "Shrink Hitbox, Halve Speed";

cast3[0] = "big bang";
cast3[1] = true;
	texts3 = ds_list_create();
		text30[0] = "You create a brand new world";
		text30[1] = "It is the same as the old one";
	ds_list_add(texts3, text30);
cast3[2] = texts3;
cast3[3] = 0;
cast3[4] = na;
cast3[5] = undefined;
cast3[6] = true;
cast3[7] = "n/a";

ds_list_add(casts, cast0, cast1, cast2, cast3);