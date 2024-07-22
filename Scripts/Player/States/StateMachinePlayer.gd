extends Node

@export var initialState: PlayerStates
var states: Dictionary = {}
var currentState: PlayerStates

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(_onStateTransition)
			child.player = get_parent()

	if !initialState:
		initialState = %Crouch

	initialState.Enter()
	currentState = initialState

func _process(delta: float) -> void:
	if currentState:
		currentState.Update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.PhysicsUpdate(delta)

func _onStateTransition(state: PlayerStates,newStateName: String) -> void:
	if state != currentState:
		return

	var newState: PlayerStates = states.get(newStateName.to_lower())

	if !newState:
		return

	if currentState:
		currentState.Exit()

	newState.Enter()
	currentState = newState
