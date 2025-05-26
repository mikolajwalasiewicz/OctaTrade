extends Node2D

@onready var tilemap_resources = $"Tile Color"
@onready var tilemap_numbers = $"Tile Number"
@onready var tilemap_settlements = $"Tile Castle"
@onready var variables = preload("res://variable.gd").new()


func _ready() -> void:
#	generate_board()
	change_cell_color(Vector2i(0, 1), 2)
	change_cell_number(Vector2i(0, 1), 5)
	
	change_cell_color(Vector2i(1, 1), 2)
	change_cell_number(Vector2i(1, 1), 5)
	
	change_cell_color(Vector2i(6, 5), 2)
	change_cell_number(Vector2i(6, 5), 5)
	
	change_cell_color(Vector2i(5, 4), 2)
	change_cell_number(Vector2i(5, 4), 5)
	generate_board()

#	for i in 10:
#		for j in 11:
#			place_settlement(Vector2i(i, j), 1)
			
	#place_settlement(Vector2i(1, 1), 1)
	#place_settlement(Vector2i(1, 2), 1)
	#place_settlement(Vector2i(2, 1), 1)

	
	can_place_settlement(Vector2i(1, 1))
	can_place_settlement(Vector2i(2, 1))
	can_place_settlement(Vector2i(1, 2))

func generate_board():
	var width = 7
	var height = 6
	
	# Zakładam, że color_id i number_id to przykładowe zakresy:
	var available_colors = [1, 2, 3, 4]  # dopasuj do swojego tilemap_resources
	var available_numbers = [2, 3, 4, 5, 6, 8, 9, 10, 11, 12]  # przykładowe liczby dla planszy (jak w Catan)
	
	# Czyścimy tilemapy
	tilemap_resources.clear()
	tilemap_numbers.clear()
	
	# Czyszczenie starego board_data
	variables.board_data.clear()
	var ite = 0
	for y in range(height):
		for x in range(width):
			if y == 0:
				continue
			
			if ite == 29:
				ite += 1 
				continue
			
			if ite == 31:
				ite += 1 
				continue
			
			if ite == 33:
				ite += 1 
				continue
			
			var cell = Vector2i(x, y)
			
			# Losujemy kolor i liczbę
			var color_id = available_colors[randi() % available_colors.size()]
			var number_id = available_numbers[randi() % available_numbers.size()]
			
			# Ustawiamy kafelki
			change_cell_color(cell, color_id)
			change_cell_number(cell, number_id)
			ite = ite+1
			print("pos = ",cell," color = ",color_id," number = ",number_id," id = ",ite)
			
			# Zapisujemy dane kafelka w zmiennej
			variables.board_data.append({
				"pos": cell,
				"color_id": color_id,
				"number_id": number_id,
			})

func change_cell_color(cell: Vector2i, number_id: int) -> void:
	var color_coords : Vector2i
	if number_id==1:
		color_coords = Vector2i(0,0)
	if number_id==2:
		color_coords = Vector2i(1,0)
	if number_id==3:
		color_coords = Vector2i(0,1)	
	if number_id==4:
		color_coords = Vector2i(1,1)

	tilemap_resources.set_cell(cell,1, color_coords)

func change_cell_number(cell: Vector2, number_id: int) -> void:	
	tilemap_numbers.set_cell(cell, number_id, Vector2i(0,0))

func fill_table_with_spots_to_place_settlements():
	for spot in variables.settlement_spots:
		var spot_pos = spot["pos"]
		var x = spot_pos.x
		var y = spot_pos.y
		
		var connected_tiles = []
		
		# Te zależności ustalasz na podstawie układu pól wokół narożnika (hardcoded pattern)
		var neighbor_positions = [
			Vector2i(x - 1, y),
			Vector2i(x, y),
			Vector2i(x - 1, y + 1)
		]

		# Jeśli spot jest na parzystym x, może trzeba zmienić układ – zależnie od planszy
		# dodaj obsługę if (x % 2 == 0) { inne neighbor_positions } jeśli potrzebujesz

		for bd in variables.board_data:
			if bd.has("pos") and bd["pos"] in neighbor_positions:
				connected_tiles.append({
					"pos": bd["pos"],
					"color_id": bd.get("color_id", -1),
					"number_id": bd.get("number_id", -1)
				})
				
		# Ustaw zasoby jeśli są 3
		if connected_tiles.size() == 3:
			spot["resource1"] = connected_tiles[0]
			spot["resource2"] = connected_tiles[1]
			spot["resource3"] = connected_tiles[2]
			print("Zaktualizowano spot na", spot["pos"], "->", spot["resource1"], spot["resource2"], spot["resource3"])
		else:
			print("❗Nie znaleziono 3 pól dla spot:", spot_pos, "-> znaleziono:", connected_tiles.size())

func place_settlement(cell: Vector2i, player_number: int):
	for tile in variables.board_data:
		if cell.x == 0:
			continue
		
			# Sprawdź, czy ten cell już jest w settlement_spots
		for spot in variables.settlement_spots:
			if spot["pos"] == cell:
				return  # Już istnieje, nie dodawaj ponownie
		
		if tile["pos"] == cell:
			# Ustawiamy grafikę osady
			tilemap_settlements.set_cell(cell, player_number-1, Vector2i(0,0))
			
			# Zapisujemy dane do settlement_spots
			variables.settlement_spots.append({
				"pos": cell,
				"occupied": true,
				"can_upgrade": true,
				"owner": player_number,
				"resource1": [],       # na razie puste
				"resource2": [],      # na razie puste
				"resource3" :[]
			})
			
			print("Dodano nową osadę gracza", player_number, "na pozycji", cell)
			fill_table_with_spots_to_place_settlements()
			break

func place_castle(cell: Vector2i, player_number: int):
	for tile in variables.board_data:
		if cell.x == 0:
			continue
		
		if tile["pos"] == cell:
			tilemap_settlements.set_cell(cell, player_number-1, Vector2i(1,0))

func can_place_settlement(pos: Vector2i) -> bool:
	print("Sprawdzam pozycję:", pos)
	for spot in variables.settlement_spots:
		print("Spot:", spot["pos"], "occupied:", spot.get("occupied", null))
		if spot["pos"] == pos:
			if spot.get("occupied", false):
				print("false (occupied == true)")
				return false
			else:
				print("true (occupied == false lub brak)")
				return true
	print("true (nie znaleziono spot )")
	return true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var click_pos = event.position
		# Zamiana na pozycję na TileMapie (map coordinates)
		var cell_pos = tilemap_settlements.local_to_map(tilemap_settlements.to_local(click_pos))
		print("✅ Kliknięto LPM na pozycji (map coords):", cell_pos)
		
		# Sprawdź, czy można postawić osadę na klikniętej kratce
		if can_place_settlement(cell_pos):
			print("✅ Pole wolne, stawiam osadę")
			place_settlement(cell_pos, 1)  # załóżmy gracz 1
		else:
			print("❌ Nie można postawić osady na tej pozycji")
			
