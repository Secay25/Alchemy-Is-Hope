class_name Crouch extends PlayerStates

const SPEED = 300.0

func Update(_delta: float) -> void:
	player.LookAtMouse()

func PhysicsUpdate(_delta: float) -> void:
	player.MovePlayer(SPEED)
