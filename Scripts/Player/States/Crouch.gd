class_name PlayerCrouch extends PlayerStates

const SPEED: float = 125.0
const MAXSTAMINA: float = 100.0
const STAMINATHRESHOLD: float = 30.0
const STAMINAINCREASE: float = 5
const CROUCHFOOTPRINT: PackedScene = preload("res://Scenes/Player/footstepcrouch.tscn")

func Enter() -> void:
	$Timer.start()

func Exit() -> void:
	$Timer.stop()

func Update(_delta: float) -> void:
	player.LookAtMouse()

func PhysicsUpdate(delta: float) -> void:
	player.MovePlayer(SPEED)
	
	if player.stamina < MAXSTAMINA:
		player.stamina += STAMINAINCREASE * delta
	
	if Input.is_action_pressed("Run") and player.stamina >= STAMINATHRESHOLD:
		Transitioned.emit(self,"Run")

func _onTimerTimeout() -> void:
	if player.velocity != Vector2.ZERO:
		var footPrint: Node2D = CROUCHFOOTPRINT.instantiate()
		player.add_child(footPrint)
		footPrint.global_position = player.global_position
		footPrint.rotation = -player.velocity.angle_to(Vector2.UP)
		
		if player.leftPrint:
			footPrint.scale.x *= -1
		
		player.leftPrint = !player.leftPrint
