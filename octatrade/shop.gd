#shop.gd
extends Node2D

var variables = Variable
@onready var tilemap_resources = $"Tile Castle"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tilemap_resources.set_cell(Vector2i(-2,-5),variables.current_player-1, Vector2i(0,0))
	tilemap_resources.set_cell(Vector2i(-2,-4),variables.current_player-1, Vector2i(1,0))# castle
	$TilePlayersResources/Label.text = str(Variable.players[Variable.current_player - 1]["resource_1"])
	$TilePlayersResources/Label2.text = str(Variable.players[Variable.current_player - 1]["resource_2"])
	$TilePlayersResources/Label3.text = str(Variable.players[Variable.current_player - 1]["resource_3"])
	$TilePlayersResources/Label4.text = str(Variable.players[Variable.current_player - 1]["resource_4"])

#esc
func _on_button_pressed() -> void:
	get_parent().set_players()


func settlement_add() -> void:
	var player = variables.players[variables.current_player - 1]

	# Koszty osady
	var cost = {
		"resource_1": 2,
		"resource_2": 1,
		"resource_3": 2,
		"resource_4": 1
	}

	# Sprawdzenie czy gracz ma zasoby
	for res in cost.keys():
		if player[res] < cost[res]:
			print("❌ Za mało surowców na osadę!")
			return

	# Odejmij zasoby
	for res in cost.keys():
		player[res] -= cost[res]

	# Zmniejsz ilość dostępnych osad
	if player["settlements_left"] > 0:
		player["settlements_left"] += 1
		print("✅ Osada postawiona!")
	else:
		print("❌ Brak dostępnych osad!")

func castle_add() -> void:
	var player = variables.players[variables.current_player - 1]

	# Koszty zamku
	var cost = {
		"resource_1": 2,
		"resource_2": 4,
		"resource_3": 2,
		"resource_4": 4
	}

	# Sprawdzenie czy gracz ma zasoby
	for res in cost.keys():
		if player[res] < cost[res]:
			print("❌ Za mało surowców na zamek!")
			return

	# Odejmij zasoby
	for res in cost.keys():
		player[res] -= cost[res]

	# Zmniejsz ilość dostępnych zamków
	if player["castles_left"] > 0:
		player["castles_left"] += 1
		print("🏰 Zamek postawiony!")
	else:
		print("❌ Brak dostępnych zamków!")
