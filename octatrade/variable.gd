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
		"settlements_left": 5,
		"castles_left": 4
	},
	{
		"id": 2,
		"name": "Gracz 2",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 5,
		"castles_left": 4
	},
		{
		"id": 3,
		"name": "Gracz 3",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 5,
		"castles_left": 4
	},
		{
		"id": 4,
		"name": "Gracz 2",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 5,
		"castles_left": 4
	},
		{
		"id": 5,
		"name": "Gracz 2",
		"resource_1": 0,
		"resource_2": 0,
		"resource_3": 0,
		"resource_4": 0,
		"settlements_left": 5,
		"castles_left": 4
	}
]

# --- Tura ---
var current_player = 1      # Kto aktualnie gra (1...player_count)

# --- Gra ---
var dice_result = 0         # Wynik rzutu kośćmi w turze
