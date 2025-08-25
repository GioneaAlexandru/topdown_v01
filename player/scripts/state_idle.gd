class_name class_state_idle extends class_state


@onready var walk: class_state_walk = $"../walk"


func enter() -> void:
	player.UpdateAnimation("idle")
	pass
	
func exit() -> void:
	pass

func process( _delta : float ) -> class_state:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null
	
func physics( _delta : float ) -> class_state:
	return null
	
func handleinput( _event: InputEvent ) -> class_state:
	return null
