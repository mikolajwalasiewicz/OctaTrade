#scene_1
extends Node2D

var value : int = 2
#var menu_scene = preload("res://Scenes/Scene2.tscn")
# Called when the node enters the scene tree for the first time.
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


func _on_button_3_pressed_start() -> void:
	get_parent().set_players()
