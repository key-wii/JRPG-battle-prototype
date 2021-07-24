function heal_player_limited(params){
	var heal = params[0],
	var listIndex = params[1];
	//var uses = params[2];
	heal_player(heal);
	
	if (menuIndex == 0)  {
		with (o_data_enemy) ds_list_delete(acts, listIndex);
		/*var times_used = o_data_enemy.acts[| listIndex][3];
		if (times_used >= uses)
			with (o_data_enemy) ds_list_delete(acts, listIndex);*/
	}
	if (menuIndex == 1)  {
		with (o_data_spells) ds_list_delete(casts, listIndex);
		/*var times_used = o_data_spells.casts[| listIndex][3];
		if (times_used >= uses)
			with (o_data_spells) ds_list_delete(casts, listIndex);*/
	}
	if (menuIndex == 2) {
		with (o_data_inventory) ds_list_delete(items, listIndex);
		/*var times_used = o_data_inventory.items[| listIndex][3];
		if (times_used == uses)
			with (o_data_inventory) ds_list_delete(items, listIndex);*/
	}
}