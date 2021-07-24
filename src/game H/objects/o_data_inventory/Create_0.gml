//inside list of commands, each command is an array of
//	0: name (string),
//  1: can_use (bool),
//  2: list of text from act (strings in arrays), last index of each array is the fullText string,
//  3: times used (int)
//  4: what it does (function)
//  5: parameters for function in #4
//  6: targets_self (bool)
//  7: description of command (string)
items = ds_list_create();

item0[0] = "lotion";
item0[1] = true;
	texts0 = ds_list_create();
		text00[0] = "You slather some lotion";
		text00[1] = "on your face";
	ds_list_add(texts0, text00);
item0[2] = texts0;
item0[3] = 0;
item0[4] = heal_player_limited;
	params0[0] = 10;		// healAmount (int)
	params0[1] = 0;			// index of this item (int)
	//params0[2] = 1;			// number of uses (int)
item0[5] = params0;
item0[6] = true;
item0[7] = "+10 HP";

ds_list_add(items, item0);