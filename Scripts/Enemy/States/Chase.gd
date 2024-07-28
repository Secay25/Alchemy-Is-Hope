class_name EnemyChase extends EnemyStates

func Enter() -> void:
	$Timer.start()
	$Timer2.start()

func Exit() -> void:
	$Timer.stop()
	$Timer2.stop()
	enemy.alertState.hide()

func PhysicsUpdate(_delta: float) -> void:
	enemy.PathFindToPlayer()

func _onTimerTimeout() -> void:
	enemy.MakePath()

func _onTimer2Timeout() -> void:
	Transitioned.emit(self,"Idle")
