class_name Enemy extends CharacterBody2D

@onready var player: Player
@onready var navAgent := $NavigationAgent2D as NavigationAgent2D
@onready var alertState := $AlertState as Sprite2D
@onready var sprite := $Sprite2D as Sprite2D
var thinking: bool = false
const SPEED: float = 175
const SPAWNSPEED: float = 2.0
const QUESTIONMARK: Texture2D = preload("res://Assets/Enemies/QuestionMark.png")
const UITROEPTEKEN: Texture2D = preload("res://Assets/Enemies/UitroepTeken.png")

func _ready() -> void:
	for child in get_parent().get_children():
		if child is Player:
			player = child
			break
	
	modulate.a = 0.0
	var tween: Tween = create_tween()
	tween.tween_property(self,"modulate:a",1.0,SPAWNSPEED)

func PathFindToPlayer() -> void:
	if player:
		var direction: Vector2 = to_local(navAgent.get_next_path_position()).normalized()
		velocity = direction * SPEED
		move_and_slide()
		
		if direction:
			var angle: float = direction.angle_to(Vector2.UP)
			sprite.rotation = -angle

func MakePath() -> void:
	navAgent.target_position = player.global_position

