extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	#esc
	Variable.building_mode = "none" 
	get_parent().get_parent().switch_to_esc()


func _on_button_2_pressed() -> void:
	#trade
	Variable.building_mode = "none" 
	get_parent().get_parent().switch_to_trade()


func _on_button_3_pressed() -> void:
	#shop
	Variable.building_mode = "none" 
	get_parent().get_parent().switch_to_shop()
