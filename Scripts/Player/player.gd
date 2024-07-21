class_name Player extends CharacterBody2D

func MovePlayer(speed: float) -> void:
	var direction: Vector2 = Vector2(int(Input.is_action_pressed("MoveRight")) - \
		int(Input.is_action_pressed("MoveLeft")),int(Input.is_action_pressed("MoveDown")) - \
		int(Input.is_action_pressed("MoveUp")))
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func LookAtMouse() -> void:
	var direction: Vector2 = get_global_mouse_position() - global_position
	direction = direction.normalized()
	var angle: float = direction.angle_to(Vector2.UP)
	rotation = -angle

func lookAtDirection(direction: Vector2) -> void:
	pass
