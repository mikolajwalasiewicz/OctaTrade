extends Node

# --- Plansza ---
var board_data = []         # Lista kafli, każdy z pos, color_id, number_id
var settlement_spots = []   # Miejsca na osady i zamki, każde: pos, occupied, owner, can_upgrade, resource1,2,3

# --- Gracze ---
var player_count = 2        # Liczba graczy (2-5)
var players = []            # Lista graczy, np. [{id=1, name="Gracz1", color=Color(...), settlements=..., castles=..., resources={}}, ...]

# --- Tura ---
var current_player = 1      # Kto aktualnie gra (1...player_count)
var turn_phase = "roll_dice" # Aktualna faza tury np. "roll_dice", "place_settlement", "trade", "build", "end_turn"

# --- Gra ---
var dice_result = 0         # Wynik rzutu kośćmi w turze
var robber_position = null  # Pozycja rozbójnika (jeśli jest w grze)

# --- Statystyki i punkty ---
var player_victory_points = {} # Słownik gracza -> liczba punktów zwycięstwa

func init_players(count):
	player_count = clamp(count, 2, 5)
	players.clear()
	for i in range(player_count):
		players.append({
			"id": i + 1,
			"name": "Gracz %d" % (i + 1),
			"color": Color(1,1,1),  # zmień na konkretne kolory
			"settlements": [],
			"castles": [],
			"resources": {
				"wood": 0, "brick": 0, "wheat": 0, "sheep": 0, "ore": 0
			}
		})
