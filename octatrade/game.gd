extends Node2D

@onready var variables = preload("res://variable.gd").new()
@onready var board = $Board

func _on_button_pressed() -> void:
	get_parent().switch_to_esc()

func _ready() -> void:
	start_game()

func show_player_turn(turn: int):
	print("Tura gracza ", turn)

func start_game():
	var max_spots = 27
	var current_spots = 0
	
	for player in range(1, variables.player_count):
		#print("Tura gracza ", player)
		variables.current_player = player
		# Tu powinien być ruch gracza, np. stawianie osady
		give_resources(variables.dice_result)
		# Zakładamy, że osada zostaje postawiona:
		current_spots += 1

		if current_spots >= max_spots:
			#print("Wszystkie miejsca zajęte, koniec gry!")
			return  # przerywamy pętlę i kończymy funkcję
			
func give_resources(dice_result: int) -> void:
	pass

func _input(event: InputEvent) -> void:
	var cell_pos = board.get_clicked_cell(event)
	if cell_pos == Vector2i(-1, -1):
		return
	
	match Variable.building_mode:
		"settlement":
			# Sprawdź, czy gracz może postawić osadę i postaw ją
			board.place_settlement(cell_pos, Variable.current_player)
		"castle":
			# Sprawdź, czy można ulepszyć osadę do zamku i ulepsz
			board.place_castle(cell_pos, Variable.current_player)
		_:
			print("Nie wybrano trybu budowy")
