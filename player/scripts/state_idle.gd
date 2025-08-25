class_name class_state_idle extends class_state


func enter() -> void:
	player.UpdateAnimation("idle")
	pass
	
func exit() -> void:
	pass

func process( _delta : float ) -> class_state:
	return null
	
func physics( _delta : float ) -> class_state:
	return null
	
func handleinput( _event: InputEvent ) -> class_state:
	return null
