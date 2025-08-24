class_name movement extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO


#Called when the node enters the scene tree for the first time
func _ready():
	pass


func _process(delta):
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	var move_speed : float = 100.0
	velocity = direction * move_speed


func _physics_process(delta):
	move_and_slide()
