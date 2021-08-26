event_inherited();

Names[| 0] = "Default Box of Placeholding";
Names_copy[| 0] = "Default Box of Placeholding";
max_hp[| 0] = 2;
hp[| 0] = max_hp[| 0];
wet[| 0] = false;
sprites[| 0] = spr_enemy1;
sprites_win[| 0] = spr_enemy_win;
dead[| 0] = false;

Names[| 1] = "Default Box of Placeholding";
Names_copy[| 1] = "Default Box of Placeholding";
max_hp[| 1] = 2;
hp[| 1] = max_hp[| 1];
wet[| 1] = false;
sprites[| 1] = spr_enemy1;
sprites_win[| 1] = spr_enemy_win;
dead[| 1] = false;

Names[| 2] = "Default Box of Placeholding";
Names_copy[| 2] = "Default Box of Placeholding";
max_hp[| 2] = 2;
hp[| 2] = max_hp[| 2];
wet[| 2] = false;
sprites[| 2] = spr_enemy1;
sprites_win[| 2] = spr_enemy_win;
dead[| 2] = false;

enemies = ds_list_size(Names);
flavor_text[0] = "flavor text is cool";
flavor_text[1] = "this is nice";

atkOrder = 0; // 0: in number order (then loops), 1: random order, 

turn = 0;
//inside list of commands, each command is an array of
//	0: name (string),
//  1: can_use (bool),
//  2: list of text from act (strings in arrays), last index of each array is the fullText string,
//  3: times used on [index] enemy (array of ints)
//  4: what it does (function)
//  5: parameter(s) for function in #4
//  6: targets_self (bool)
//  7: description of command (string)
acts = ds_list_create();

act0[0] = "this is an act";
act0[1] = true;
	texts0 = ds_list_create();
		text00[0] = "Maximum length of text line  :)";
		text00[1] = "You just did... an act";
		text01[0] = "You lookin real sussy";
		text02[0] = "This is the last dialogue";
		text02[1] = "-";
		text02[2] = "It is not much, but it is mine";
	ds_list_add(texts0, text00, text01, text02);
act0[2] = texts0;
act0[3] = 0;
act0[4] = na;
act0[5] = undefined;
act0[6] = false;
act0[7] = "Test";

act1[0] = "lick";
act1[1] = true;
	texts1 = ds_list_create();
		text10[0] = "You just licked a square";
		text11[0] = "Why did you just lick a square?";
		text12[0] = "Plese stop licking";
		text12[1] = "It is unsanitary";
	ds_list_add(texts1, text10, text11, text12);
act1[2] = texts1;
act1[3] = 0;
act1[4] = damage_enemy;
act1[5] = 1;
act1[6] = false;
act1[7] = "-1 HP";

act2[0] = "meme";
act2[1] = true;
	texts2 = ds_list_create();
		text20[0] = "You meme'd";
		text21[0] = "You continue to meme";
		text22[0] = "You meme a third time";
	ds_list_add(texts2, text20, text21, text22);
act2[2] = texts2;
act2[3] = 0;
act2[4] = damage_enemy;
act2[5] = 2;
act2[6] = false;
act2[7] = "-2 HP";

act3[0] = "eat slime";
act3[1] = true;
	texts3 = ds_list_create();
		text30[0] = "You taste some slime";
		text31[0] = "Slime sure is tasty";
		text32[0] = "Your tummy is filled with slime";
	ds_list_add(texts3, text30, text31, text32);
act3[2] = texts3;
act3[3] = 0;
act3[4] = damage_enemy;
act3[5] = 6;
act3[6] = false;
act3[7] = "-6 HP";

act4[0] = "menacing stare";
act4[1] = true;
	texts4 = ds_list_create();
		text40[0] = "Don't look at me like that";
		text41[0] = "Stop looking at me like that...";
		text42[0] = "Your stare has no power here";
	ds_list_add(texts4, text40, text41, text42);
act4[2] = texts4;
act4[3] = 0;
act4[4] = na;
act4[5] = undefined;
act4[6] = false;
act4[7] = "n/a";

ds_list_add(acts, act0, act1, act2, act3, act4);


actsWin = ds_list_create();

actW0[0] = "vicory lap";
actW0[1] = true;
	textsW0 = ds_list_create();
		textW00[0] = "Get PWN'd!";
	ds_list_add(textsW0, textW00);
actW0[2] = textsW0;
actW0[3] = 0;
actW0[4] = na;
actW0[5] = 0;
actW0[6] = false;
actW0[7] = "";

actW1[0] = "leave";
actW1[1] = true;
	textsW1 = ds_list_create();
		textW10[0] = "You exit the scene";
	ds_list_add(textsW1, textW10);
actW1[2] = textsW1;
actW1[3] = 0;
actW1[4] = leave;
actW1[5] = undefined;
actW1[6] = true;
actW1[7] = "->";

ds_list_add(actsWin, actW0, actW1);


var xx = room_width / 2;
var yy = room_height - (room_height / 1.9);
//array of attacks, each attack is an array of
//  0: timeline,
//  1: box_width,
//  2: box_height,
//  3: box_left,
//  4: box_top,
//  5: attack_duration
atk_[0][0] = t_enemyTest_atk1;
atk_[0][1] = 200;
atk_[0][2] = 262;
atk_[0][3] = xx - (atk_[0][1] / 2);
atk_[0][4] = yy + 45;
atk_[0][5] = 150;

atk_[1][0] = t_enemyTest_atk2;
atk_[1][1] = 262;
atk_[1][2] = 262;
atk_[1][3] = xx - (atk_[1][1] / 2);
atk_[1][4] = yy + 45;
atk_[1][5] = 150;

atk_[2][0] = t_enemyTest_atk3;
atk_[2][1] = 320;
atk_[2][2] = 262;
atk_[2][3] = xx - (atk_[2][1] / 2);
atk_[2][4] = yy + 45;
atk_[2][5] = 150;


atkT[0][0] = t_enemyTestTeam_atk1;
atkT[0][1] = 200;
atkT[0][2] = 262;
atkT[0][3] = xx - (atkT[0][1] / 2);
atkT[0][4] = yy + 45;
atkT[0][5] = 170;

atkT[1][0] = t_enemyTestTeam_atk2;
atkT[1][1] = 262;
atkT[1][2] = 262;
atkT[1][3] = xx - (atkT[1][1] / 2);
atkT[1][4] = yy + 45;
atkT[1][5] = 170;

atkT[2][0] = t_enemyTestTeam_atk3;
atkT[2][1] = 320;
atkT[2][2] = 262;
atkT[2][3] = xx - (atkT[2][1] / 2);
atkT[2][4] = yy + 45;
atkT[2][5] = 170;


atkT3[0][0] = t_enemyTestTrio_atk;
atkT3[0][1] = 450;
atkT3[0][2] = 262;
atkT3[0][3] = xx - (atkT3[0][1] / 2);
atkT3[0][4] = yy + 45;
atkT3[0][5] = 200;


	   if (ds_list_size(Names) == 1) {
	atk = atk_;
} else if (ds_list_size(Names) == 2 &&
	Names[| 0] == Names[| 1]) {
		atk = atkT;
} else if (ds_list_size(Names) == 3 &&
	Names[| 0] == Names[| 1] && Names[| 1] == Names[| 2]) {
		atk = atkT3;
}