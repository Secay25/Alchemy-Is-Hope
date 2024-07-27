extends Node

@export var initialState: EnemyStates
var states: Dictionary = {}
var currentState: EnemyStates

func _ready() -> void:
	for child in get_children():
		if child is EnemyStates:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(_onStateTransition)
			child.enemy = get_parent()
	
	if !initialState:
		initialState = $EnemySpawning
	
	initialState.Enter()
	currentState = initialState

func _process(delta: float) -> void:
	if currentState:
		currentState.Update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.PhysicsUpdate(delta)

func _onStateTransition(state: EnemyStates,newStateName: String) -> void:
	if state != currentState:
		return
	
	var newState: EnemyStates = states.get(newStateName.to_lower())
	
	if !newState:
		return
	
	if currentState:
		currentState.Exit()
	
	newState.Enter()
	currentState = newState
