extends "res://src/classes/Unit.gd"

#	(type)
#	(health)
#	(max_health)
#	(movement_distance)
#	(current_position)
#	(name)

func _ready() -> void:
	_move(Vector2(-3,4))
	pass
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
#extends Node2D
#
#export var GridControl2D: Resource = preload("res://src/classes/GridControl2D.tres")
##Only use these once because I want to pass all the values in at once...
## maybe extending would be better but I am too tiered to mess around with that 
#
#export var _movement_distance : int = 5
#export var _health : int = 10
#export var _max_health : int = 10
#export var _current_position : Vector2 = Vector2(0, 0)
#
#onready var _myUnit = Unit.new("Enemy", _health, _max_health, _max_health,
#								 _current_position, self.name)
##	(type)
##	(health)
##	(max_health)
##	(movement_distance)
##	(current_position)
##	(name)
#
#func _ready() -> void:
#
#	var movement = Vector2(2,2)
#
#	var movement_value = GridControl2D.move_request(movement, _myUnit)
#	if movement_value:
#		print ("moved")
#		move_local_x(movement_value.y)
#		move_local_y(movement_value.y)
