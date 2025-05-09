extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	#esc
	get_parent().get_parent().switch_to_esc()


func _on_button_2_pressed() -> void:
	#trade
	get_parent().get_parent().switch_to_trade()


func _on_button_3_pressed() -> void:
	#shop
	get_parent().get_parent().switch_to_shop()
