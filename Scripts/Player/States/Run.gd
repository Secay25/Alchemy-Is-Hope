class_name Run extends PlayerStates

var leftPrint: bool = false
const SPEED: float = 250.0
const STAMINADECREASE: float = 15
const RUNFOOTPRINT: PackedScene = preload("res://Scenes/Player/footsteprun.tscn")

func Enter() -> void:
	$Timer.start()

func Exit() -> void:
	$Timer.stop()

func Update(_delta: float) -> void:
	player.LookAtMouse()

func PhysicsUpdate(delta: float) -> void:
	player.MovePlayer(SPEED)
	player.stamina -= STAMINADECREASE * delta
	
	if player.stamina <= 0.0 or Input.is_action_just_released("Run") or player.velocity == Vector2.ZERO:
		Transitioned.emit(self,"Crouch")

func _onTimerTimeout() -> void:
	if player.velocity != Vector2.ZERO: 
		var footPrint: Node2D = RUNFOOTPRINT.instantiate()
		player.add_child(footPrint)
		footPrint.global_position = player.global_position
		footPrint.rotation = -player.velocity.angle_to(Vector2.UP)
		
		if player.leftPrint:
			footPrint.scale.x *= -1
		
		player.leftPrint = !player.leftPrint

