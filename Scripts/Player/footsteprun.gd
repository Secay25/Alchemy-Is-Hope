extends Sprite2D

const DISSAPEARDURATION: float = 1.5

func _onTimerTimeout() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self,"self_modulate:a",0,DISSAPEARDURATION)
	tween.chain().tween_callback(queue_free)
