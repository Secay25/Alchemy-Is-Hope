class_name EnemyIdle extends EnemyStates

@onready var timer: Timer = $Timer
@onready var cdTimer: Timer = $Timer2
var susMeter: float = 0.0
const SUSINCREASE: float = 2
const SUSDECREASE: float = .05
const SUSMAX: float = 1.0

func Enter() -> void:
	susMeter = 0.0
	cdTimer.start()
	enemy.thinking = false

func Exit() -> void:
	timer.stop()

func Update(delta: float) -> void:
	if !cdTimer.is_stopped():
		enemy.thinking = false
	
	if enemy.thinking:
		if !enemy.alertState.visible and susMeter < .5:
			enemy.alertState.texture = enemy.QUESTIONMARK
			enemy.alertState.show()
		
		if susMeter > .9:
			enemy.alertState.texture = enemy.UITROEPTEKEN
		else:
			enemy.alertState.texture = enemy.QUESTIONMARK
		
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
