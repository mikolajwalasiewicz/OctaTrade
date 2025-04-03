extends Node2D

var value : int = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	get_tree().change_scene_to_file("res://Scenes/Scene2.tscn")
