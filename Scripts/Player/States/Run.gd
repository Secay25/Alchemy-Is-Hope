class_name Run extends PlayerStates

const SPEED: float = 400.0
const STAMINADECREASE: float = 15

func Update(_delta: float) -> void:
	player.LookAtMouse()

func PhysicsUpdate(delta: float) -> void:
	player.MovePlayer(SPEED)
	player.stamina -= STAMINADECREASE * delta
	
	if player.stamina <= 0.0 or Input.is_action_just_released("Run") or player.velocity == Vector2.ZERO:
		Transitioned.emit(self,"Crouch")
