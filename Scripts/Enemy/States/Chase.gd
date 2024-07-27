class_name EnemyChase extends EnemyStates

func Enter() -> void:
	$Timer.start()

func Exit() -> void:
	$Timer.stop()

func PhysicsUpdate(_delta: float) -> void:
	enemy.PathFindToPlayer()

func _onTimerTimeout() -> void:
	enemy.MakePath()
