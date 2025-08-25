class_name player_state_machine extends Node


var states : Array[ class_state ]
var prev_state : class_state
var current_state : class_state


# Called when the node first enters the scene tree
func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass  # Nothing here yet, placeholder

# Frame update (handles input and animations)
func _process(delta):
	change_state( current_state.process( delta ))
	# Collect horizontal/vertical input
	pass

func _physics_process(delta):
	change_state( current_state.physics( delta ))
	# Collect horizontal/vertical input
	pass

func _unhandled_input(event):
	change_state(current_state.handleinput( event ))
	pass

func initialize( _player : class_player) -> void:
	states = []
	
	for c in get_children():
		if c is class_state:
			states.append(c)
			
	if states.size() > 0:
		states[0].player = _player
		change_state( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state( new_state : class_state) -> void:
	if new_state == null || new_state == current_state:
		return
		
	if current_state:
		current_state.exit()
		
	prev_state = current_state
	current_state = new_state
	current_state.enter()
