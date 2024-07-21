class_name Crouch extends PlayerStates

const SPEED: float = 150.0
const MAXSTAMINA: float = 100.0
const STAMINATHRESHOLD: float = 30.0
const STAMINAINCREASE: float = 5

func Update(_delta: float) -> void:
	player.LookAtMouse()

func PhysicsUpdate(delta: float) -> void:
	player.MovePlayer(SPEED)
	
	if player.stamina < MAXSTAMINA:
		player.stamina += STAMINAINCREASE * delta
	
	if Input.is_action_pressed("Run") and player.stamina >= STAMINATHRESHOLD:
		Transitioned.emit(self,"Run")
