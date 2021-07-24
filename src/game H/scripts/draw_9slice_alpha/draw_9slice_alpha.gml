function draw_9slice_alpha() {
	/// @param x
	/// @param y
	/// @param w
	/// @param h
	/// @param sprite
	/// @param subimg
	/// @param alpha

	//Args
	var _x = argument[0];
	var _y = argument[1];
	var _w = argument[2];
	var _h = argument[3];
	var _sprite = argument[4];
	var _subimg = argument[5];
	var _alpha = argument[6];

	//Data
	var cellSize = sprite_get_width(_sprite) / 3;

	var mainW = _w - cellSize * 2;
	var mainH = _h - cellSize * 2;

	var mainScaleW = mainW / cellSize;
	var mainScaleH = mainH / cellSize;

	///Corners
	//Top left
	draw_sprite_part_ext(_sprite, _subimg, 0, 0, cellSize, cellSize, _x, _y, 1, 1, -1, _alpha);
    
	//Top Right
	draw_sprite_part_ext(_sprite, _subimg, cellSize*2, 0, cellSize, cellSize, (_x + _w) - cellSize, _y, 1, 1, -1, _alpha);
    
	//Bottom left
	draw_sprite_part_ext(_sprite, _subimg, 0, cellSize*2, cellSize, cellSize, _x, (_y + _h) - cellSize, 1, 1, -1, _alpha);
    
	//Bottom Right
	draw_sprite_part_ext(_sprite, _subimg, cellSize*2, cellSize*2, cellSize, cellSize, (_x + _w) - cellSize, (_y + _h) - cellSize, 1, 1, -1, _alpha);

	///Other
	//Center
	draw_sprite_part_ext(_sprite, _subimg, cellSize, cellSize, cellSize, cellSize, _x + cellSize, _y + cellSize, mainScaleW, mainScaleH, -1, _alpha);

	//Top
	draw_sprite_part_ext(_sprite, _subimg, cellSize, 0, cellSize, cellSize, _x + cellSize, _y, mainScaleW, 1, -1, _alpha);
        
	//Bottom
	draw_sprite_part_ext(_sprite, _subimg, cellSize, cellSize*2, cellSize, cellSize, _x + cellSize, (_y + _h) - cellSize, mainScaleW, 1, -1, _alpha);
        
	//Left
	draw_sprite_part_ext(_sprite, _subimg, 0, cellSize, cellSize, cellSize, _x, _y + cellSize, 1, mainScaleH, -1, _alpha);
        
	//Right
	draw_sprite_part_ext(_sprite, _subimg, cellSize*2, cellSize, cellSize, cellSize, (_x + _w) - cellSize, _y + cellSize, 1, mainScaleH, -1, _alpha);
}