extends Sprite2D

const DISSAPEARDURATION: float = 1.5

func _onTimerTimeout() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self,"self_modulate:a",0,DISSAPEARDURATION)
	tween.chain().tween_callback(queue_free)

func _onAnimatedSprite2dAnimationFinished() -> void:
	$AnimatedSprite2D.queue_free()

func _onArea2dBodyEntered(body: Node2D) -> void:
	if body is Enemy:
		body.thinking = true

func _onAreaTimerTimeout() -> void:
	$Area2D.queue_free()
