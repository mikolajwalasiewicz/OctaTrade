extends Node2D

@onready var variables = preload("res://variable.gd").new()

func _on_button_pressed() -> void:
	get_parent().switch_to_esc()

func _ready() -> void:
	start_game()

func start_game():
	var max_spots = 27
	var current_spots = 0
	
	for player in range(1, variables.player_count):
		print("Tura gracza ", player)

		# Tu powinien być ruch gracza, np. stawianie osady
		give_resources(variables.dice_result)
		# Zakładamy, że osada zostaje postawiona:
		current_spots += 1

		if current_spots >= max_spots:
			print("Wszystkie miejsca zajęte, koniec gry!")
			return  # przerywamy pętlę i kończymy funkcję

func give_resources(dice_result: int) -> void:
	pass
