extends Node2D

@onready var button = $Button
@onready var label = $Label
@onready var timer = Timer.new()

var time_left = 60.0  # czas startowy w sekundach

func _ready() -> void:
	add_child(timer)
	timer.wait_time = 0.01
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	label.text = String("%.2f" % time_left)
	button.connect("pressed", Callable(self, "_on_button_pressed"))

func start_timer():
	button.visible = false
	time_left = 15.0
	label.text = String("%.2f" % time_left)
	timer.start()

func stop_timer():
	timer.stop()

func _on_timer_timeout():
	time_left -= 0.01
	if time_left < 0:
		button.visible = true
		timer.stop()
		label.text = "Koniec!"
		Variable.end_of_time = true
		button.text = "Player " + str(Variable.current_player+1)
		if(Variable.current_player == Variable.player_count):
			button.text = "Player " + str(1)
		return
	label.text = String("%.2f" % time_left)

func _on_button_pressed():
	print(Variable.current_player)
	print(Variable.player_count)
	if(Variable.current_player == Variable.player_count):
		Variable.current_player = 0
	
	Variable.current_player += 1
	#dice_node.unlock_button()
	start_timer()
