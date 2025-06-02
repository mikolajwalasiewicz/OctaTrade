extends Node

# --- Plansza ---
var board_data = []         # Lista kafli, każdy z pos, color_id, number_id
var settlement_spots = []   # Miejsca na osady i zamki, każde: pos, occupied, owner, can_upgrade, resource1,2,3

# --- Gracze ---
var player_count = 2        # Liczba graczy (2-5)
var players = [
	{
		"id": 1,
		"name": "Gracz 1",
		"resource_1": 1,
		"resource_2": 20,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 1,
		"castles_left": 1
	},
	{
		"id": 2,
		"name": "Gracz 2",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 1,
		"castles_left": 1
	},
		{
		"id": 3,
		"name": "Gracz 3",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 1,
		"castles_left": 1
	},
		{
		"id": 4,
		"name": "Gracz 2",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 1,
		"castles_left": 1
	},
		{
		"id": 5,
		"name": "Gracz 2",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 1,
		"castles_left": 1
	}
]

# --- Tura ---
var current_player = 1      # Kto aktualnie gra (1...player_count)

# --- Gra ---
var dice_result = 0         # Wynik rzutu kośćmi w turze
var building_mode := "none" # albo "castle"
var end_of_time = false

func reset_game():
	# Reset planszy
	board_data.clear()
	settlement_spots.clear()

	# Reset tury i trybu budowania
	current_player = 1
	dice_result = 0
	building_mode = "none"

	# Reset graczy (w zależności od player_count)
	for i in range(players.size()):
		var is_active = i < player_count
		players[i]["resource_1"] = 0
		players[i]["resource_2"] = 0
		players[i]["resource_3"] = 0
		players[i]["resource_4"] = 0
		players[i]["settlements_left"] = 1
		players[i]["castles_left"] = 1
