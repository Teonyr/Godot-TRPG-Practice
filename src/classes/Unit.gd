extends Node2D
class_name Unit

onready var unit_name : String = self.name
export var unit_type : String
export var max_health : int = 10
export var health : int = 10
export var movement_distance : int = 10
onready var current_position : Vector2 = self.position

#load was preload, but I got some complex error - I hope it doesn't make too much difference
#https://libredd.it/r/godot/comments/hu213d/class_was_found_in_global_scope_but_its_script/
var GridControl2D : Resource = load("res://src/classes/GridControl2D.tres")

# I need to register with the grid with my actual position

func _ready() -> void:
	GridControl2D.register_new(self)
	_snap_to_grid()

func _snap_to_grid():
	move_local_x(GridControl2D.snap_unit(self).x - current_position.x)
	move_local_y(GridControl2D.snap_unit(self).y - current_position.y)
	current_position = self.position

func _move(movement : Vector2):
	var movement_value = GridControl2D.move_request(movement, self)
	if movement_value:
		print ("moved")
		move_local_x(movement_value.x)
		move_local_y(movement_value.y)
	#Maybe 	_snap_to_grid()?


























#func _init(type:String, health:int, max_health:int, movement_distance:int,
#	current_position:Vector2, name:String) -> void:
#	set_name(name)
#	set_type(type)
#	set_health(health)
#	set_max_health(max_health)
#	set_movement_distance(movement_distance)
#	set_current_position(current_position)
#	pass
#
#func set_name(name:String):
#	self._unit_name = name
#func get_name() -> String:
#	return _unit_name
#
#func set_type(type:String):
#	self._unit_type = type
#func get_type() -> String:
#	return _unit_type
#
#func set_max_health(health:int):
#	self._max_health = health
#func get_max_health() -> int:
#	return _max_health
#
#func set_health(health:int):
#	self._health = health
#func get_health() -> int:
#	return _health
#
#func set_movement_distance(distance:int):
#	self._movement_distance = distance
#func get_movement_distance() -> int:
#	return _movement_distance
#
#func set_current_position(position:Vector2):
#	self._current_position = position
#func get_current_position() -> Vector2:
#	return _current_position
