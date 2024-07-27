class_name Player extends CharacterBody2D

var stamina: float = 100.0
var leftPrint: bool = false

func MovePlayer(speed: float) -> void:
	var direction: Vector2 = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	velocity = direction.normalized() * speed
	move_and_slide()

func LookAtMouse() -> void:
	var direction: Vector2 = get_global_mouse_position() - global_position
	var angle: float = direction.angle_to(Vector2.UP)
	rotation = -angle

func LookAtDirection(_direction: Vector2) -> void:
	pass

func _onArea2dBodyEntered(body: Node2D) -> void:
	if body is Enemy:
		GLOBAL.SwitchScenes(get_parent(),load("res://Scenes/death_screen.tscn") as PackedScene)
