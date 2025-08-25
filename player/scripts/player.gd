# This script controls the player’s player, direction, state, and animations
class_name class_player extends CharacterBody2D   # Inherits physics/player functionality

# Stores which way the player is *facing* (not necessarily moving)
var cardinal_direction : Vector2 = Vector2.DOWN
# Stores raw player input each frame
var direction : Vector2 = Vector2.ZERO


# References to child nodes
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var state_machine: player_state_machine = $state_machine


# Called when the node first enters the scene tree
func _ready():
	state_machine.initialize(self)
	pass  # Nothing here yet, placeholder

# Frame update (handles input and animations)
func _process(_delta):
	# Collect horizontal/vertical input
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	pass

# Physics step (actually moves the player)
func _physics_process(_delta):
	move_and_slide()   # Uses velocity set in _process()

# Updates the facing direction (LEFT/RIGHT/UP/DOWN)
func UpdateDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction  # Start with current
	
	# If no input → direction unchanged
	if direction == Vector2.ZERO:
		return false
	
	# Prioritize horizontal player when y == 0
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	# Prioritize vertical player when x == 0
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	# If facing direction hasn’t changed → nothing to update
	if new_dir == cardinal_direction:
		return true
	
	# Save new direction
	cardinal_direction = new_dir
	
	# Flip sprite horizontally when facing left
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true

# Plays the correct animation based on state and direction
func UpdateAnimation(state : String) -> void:
	# Example result: "walk_down", "idle_side", etc.
	animation_player.play(state + "_" + AnimDirection())
	pass

# Returns a string for animation suffix ("up", "down", or "side")
func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
