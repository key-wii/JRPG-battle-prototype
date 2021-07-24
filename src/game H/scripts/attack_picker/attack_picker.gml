function attack_picker(order, turn){
	
	// 0: in number order (then loops), 1: random order, 
	switch (order) {
		case 0:
			return turn mod array_length(o_data_enemy.atk);
		case 1:
			return irandom(array_length(o_data_enemy.atk) - 1);
	}
	
}