extends Control

func _onButtonPressed() -> void:
	GLOBAL.SwitchScenes(self,load("res://Scenes/test_room.tscn"))
