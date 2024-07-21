class_name Player extends CharacterBody2D

var stamina: float = 100.0

func MovePlayer(speed: float) -> void:
	var direction: Vector2 = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	velocity = direction * speed
	move_and_slide()

func LookAtMouse() -> void:
	var direction: Vector2 = get_global_mouse_position() - global_position
	var angle: float = direction.angle_to(Vector2.UP)
	rotation = -angle

func lookAtDirection(_direction: Vector2) -> void:
	pass
