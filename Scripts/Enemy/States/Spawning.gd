class_name EnemySpawning extends EnemyStates

func Update(_delta: float) -> void:
	if enemy.modulate.a >= 1.0:
		Transitioned.emit(self,"Idle")
