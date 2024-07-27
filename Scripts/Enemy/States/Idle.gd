class_name EnemyIdle extends EnemyStates

@onready var timer: Timer = $Timer
var susMeter: float = 0.0
const SUSINCREASE: float = 10
const SUSDECREASE: float = 5
const SUSMAX: float = 1.0

func Update(delta: float) -> void:
	if enemy.thinking:
		susMeter += SUSINCREASE * delta
		if susMeter >= SUSMAX:
			Transitioned.emit(self,"Chase")
		
		if timer.is_stopped():
			timer.start()
	else:
		susMeter -= SUSDECREASE * delta
		
		if susMeter < 0.0:
			susMeter = 0.0

func _onTimerTimeout() -> void:
	enemy.thinking = false
