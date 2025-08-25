class_name class_state_walk extends class_state


@export var move_speed : float = 100.0
@onready var idle: class_state = $"../idle"



func enter() -> void:
	player.UpdateAnimation("walk")
	pass
	
func exit() -> void:
	pass

func process( _delta : float ) -> class_state:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.UpdateDirection():
		player.UpdateAnimation("walk")
	
	return null
	
func physics( _delta : float ) -> class_state:
	return null
	
func handleinput( _event: InputEvent ) -> class_state:
	return null
