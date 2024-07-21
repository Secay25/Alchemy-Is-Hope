extends Node

@export var initialState: PlayerStates
var states: Dictionary = {}
var currentState: PlayerStates

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(_onStateTransition)

	if !initialState:
		initialState = %Crouch

	initialState.Enter()
	initialState.player = get_parent()
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
	newState.player = get_parent()
	currentState = newState
