class_name Enemy extends CharacterBody2D

@export var player: Player
@onready var navAgent := $NavigationAgent2D as NavigationAgent2D
var thinking: bool = false
const SPEED: float = 150
const SPAWNSPEED: float = 2.0

func _ready() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self,"modulate:a",1.0,SPAWNSPEED)

func PathFindToPlayer() -> void:
	if player:
		var direction: Vector2 = to_local(navAgent.get_next_path_position()).normalized()
		velocity = direction * SPEED
		move_and_slide()

func MakePath() -> void:
	navAgent.target_position = player.global_position

