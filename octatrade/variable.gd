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
		"resource_1": 2,
		"resource_2": 1,
		"resource_3": 2,
		"resource_4": 1,
		"settlements_left": 1,
		"castles_left": 1,
		"points" : 0
	},
	{
		"id": 2,
		"name": "Gracz 2",
		"resource_1": 2,
		"resource_2": 1,
		"resource_3": 2,
		"resource_4": 1,
		"settlements_left": 1,
		"castles_left": 1,
		"points" : 0
	},
		{
		"id": 3,
		"name": "Gracz 3",
		"resource_1": 1,
		"resource_2": 2,
		"resource_3": 1,
		"resource_4": 2,
		"settlements_left": 1,
		"castles_left": 1,
		"points" : 0
	},
		{
		"id": 4,
		"name": "Gracz 4",
		"resource_1": 2,
		"resource_2": 1,
		"resource_3": 2,
		"resource_4": 1,
		"settlements_left": 1,
		"castles_left": 1,
		"points" : 0
	},
		{
		"id": 5,
		"name": "Gracz 5",
		"resource_1": 1,
		"resource_2": 2,
		"resource_3": 1,
		"resource_4": 2,
		"settlements_left": 1,
		"castles_left": 1,
		"points" : 0
	}
]

# --- Tura ---
var current_player = 1      # Kto aktualnie gra (1...player_count)

# --- Gra ---
var dice_result = 0         # Wynik rzutu kośćmi w turze
var building_mode := "none" # albo "castle"
var end_of_time = false
var rolldice = false
var trade_ratio = 2		#1:x
var trade_ratio_to = 1		#x:2

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
		players[i]["resource_1"] = 2
		players[i]["resource_2"] = 1
		players[i]["resource_3"] = 2
		players[i]["resource_4"] = 1
		players[i]["settlements_left"] = 1
		players[i]["castles_left"] = 1

func get_resource_from_number():
	if dice_result == 0:
		return # Nie rzucano jeszcze kośćmi

	for spot in settlement_spots:
		# Pobierz zasoby tylko jeśli pole jest zajęte
		if spot.get("occupied", false) == false:
			continue

		var player_id = spot.get("owner", -1)
		if player_id == -1:
			continue

		# Ile surowców ma otrzymać? (1 za osadę, 2 za zamek)
		var resource_multiplier = 1
		if spot.get("can_upgrade", true) == false:
			resource_multiplier = 2

		# Sprawdź czy któryś z przypisanych pól ma numer odpowiadający wynikowi rzutu
		for res_key in ["resource1", "resource2", "resource3","resource4"]:
			if spot.has(res_key):
				var res = spot[res_key]
				if typeof(res) == TYPE_DICTIONARY and res.has("number_id") and res["number_id"] == dice_result:
					var resource_type = res.get("color_id", -1)
					
					if resource_type == -1:
						continue
					
					# Nazwa pola zasobu w strukturze gracza
					var resource_field = "resource_%d" % resource_type
					
					if player_id > 0 and player_id <= player_count:
						# Zwiększ zasób gracza
						players[player_id - 1][resource_field] += resource_multiplier
						print("🎲 Gracz", player_id, "otrzymuje", resource_multiplier, "x", resource_field)
