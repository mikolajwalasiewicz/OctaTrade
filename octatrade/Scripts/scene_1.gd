#scene_1
extends Node2D

@onready var variables = preload("res://variable.gd").new()

var value : int = 2

func _ready() -> void:
		# Dodajemy scenę Menu jako dziecko World
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	$Label2.text = str(value)
	if value < 5:
		value += 1
	$Label2.text = str(value)


func _on_button_2_pressed() -> void:
	$Label2.text = str(value)
	if value > 2:
		value -= 1
	$Label2.text = str(value)

func set_player_count():
	variables.player_count = value

func _on_button_3_pressed_start() -> void:
	set_player_count()
	#print("liczba Graczy: ", variables.player_count)
	get_parent().set_players()
