extends Resource
#class_name GridControl2D
# not needed, only causes issues because resourse needs to be loaded

#tool #not sure why this would need to run at all times in the editor 
export var grid_size = Vector2()
export var tile_size = Vector2()

var grid = _create_grid(grid_size.x, grid_size.y)


func snap_unit (unit : Unit) -> Vector2:
	#find coordinates in grid and turns it into a position
	var out = _coordinates_to_position(_find_grid_coordinates(unit.name))
	#convert to the center of a tile
	out += tile_size/2
	return out


func register_new (unit : Unit):
	#turn the position into coordinates
	var current_coordinates = (unit.current_position / tile_size)
	
	#remove the decimal places (round down)
	current_coordinates.x = int(current_coordinates.x)
	current_coordinates.y = int(current_coordinates.y)
	
	#add the name (which must be unique due to godot) to the grid
	grid[current_coordinates.x][current_coordinates.y] = unit.name
	pass


func move_request (movement_vector : Vector2, unit : Unit):
	# recieve a movement request,			DONE
	# check its valid,						DONE (HAPPY PATH!!!)
	# change the 2d array,					TODO
	# send signals out to refresh position	CHANGED/DONE
		# now just returns the value for the unit to move 
	
	var current_coordinates = _find_grid_coordinates(unit.name)
	var target_coordinates = current_coordinates + movement_vector
	
	#Check if it is moving too far
	if (unit.movement_distance < abs(movement_vector.x) or
		unit.movement_distance < abs(movement_vector.y)):
		return null
	
	#Check if its moving outside the grid
	if (target_coordinates.x > grid_size.x or
		target_coordinates.y > grid_size.y or
		target_coordinates.x < 0 or
		target_coordinates.y < 0):
		return null
	
	#Check if an another unit is in that space
	if grid[target_coordinates.x][target_coordinates.y] != null:
		return null
	
	#Update where that unit is on the grid
	_move_unit_in_grid(current_coordinates, target_coordinates)
	
	#Return an actual value which is then moved by the Unit
	return _coordinates_to_position(movement_vector)


func _find_grid_coordinates (name : String):
	for x in grid_size.x:
		for y in grid_size.y:
			if grid[x][y] == name:
				return Vector2(x,y)
	return null


func _move_unit_in_grid (from : Vector2, to : Vector2):
	#this is a simple method that moves one value to another place on the grid
	var value = grid[from.x][from.y]
	grid[from.x][from.y] = null
	grid[to.x][to.y] = value


func _create_grid (x, y):
	var out = []
	
	for _i in range(x):
		var col = []
		col.resize(y)
		out.append(col)
	
	return out


func _coordinates_to_position (coordinates : Vector2) -> Vector2:
	return coordinates * tile_size

















# REMOVED:

# Removed because this should only be done once, and we should use the grid from then on
#func position_to_coordinates(position : Vector2) -> Vector2:
#	var out = (position / tile_size)
#	#remove the decimal places
#	out.x = int(out.x)
#	out.y = int(out.y)
#	return out
