extends Node

@onready var parent: Node = get_parent()

func SwitchScenes(currentScene: Node,nextScene: PackedScene) -> void:
	currentScene.queue_free()
	var scene: Node = nextScene.instantiate()
	get_tree().root.add_child(scene)
