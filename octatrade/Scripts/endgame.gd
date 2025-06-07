extends Node2D

@onready var label_positions = [$Label, $Label2, $Label3, $Label4, $Label5]
@onready var player_names = [$Player1, $Player2, $Player3, $Player4, $Player5]
@onready var points_labels = [$Points1, $Points2, $Points3, $Points4, $Points5]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_leaderboard()

func update_leaderboard() -> void:
	var active_players = Variable.players.slice(0, Variable.player_count)
	
	# Sortujemy graczy po punktach malejąco
	active_players = sort_players_by_points_desc(active_players)
	
	# Pokazujemy tylko tyle, ile jest aktywnych graczy
	for i in range(label_positions.size()):
		if i < Variable.player_count:
			label_positions[i].text = str(i + 1) + "."
			player_names[i].text = active_players[i]["name"]
			points_labels[i].text = str(active_players[i]["points"])
			
			# Pokazujemy elementy
			label_positions[i].show()
			player_names[i].show()
			points_labels[i].show()
		else:
			# Ukrywamy nieużywane etykiety
			label_positions[i].hide()
			player_names[i].hide()
			points_labels[i].hide()

func _sort_by_points_desc(a, b) -> int:
	# Zwraca -1 jeśli a ma więcej punktów, 1 jeśli b ma więcej, 0 jeśli równe
	if a["points"] > b["points"]:
		return -1
	elif a["points"] < b["points"]:
		return 1
	else:
		return 0

func sort_players_by_points_desc(players: Array) -> Array:
	var n = players.size()
	for i in range(n):
		for j in range(0, n - i - 1):
			if players[j]["points"] < players[j + 1]["points"]:
				# Zamiana miejscami
				var temp = players[j]
				players[j] = players[j + 1]
				players[j + 1] = temp
	return players


func restart_game() -> void:
	Variable.reset_game()
	get_parent().set_game()
