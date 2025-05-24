extends Node2D

var esc_scene = preload("res://Scenes/esc.tscn")
var scene1 = preload("res://Scenes/scene1.tscn")
var game_scene = preload("res://Scenes/game.tscn")
var shop_scene = preload("res://Scenes/shop.tscn")
var trade_scene = preload("res://Scenes/trade.tscn")

var awaiting_game_scene: Node = null
var current_scene: Node = null

func _ready() -> void:
	current_scene = scene1.instantiate()
	add_child(current_scene)

func switch_to_esc():
	if current_scene:
		if current_scene != awaiting_game_scene:
			awaiting_game_scene = current_scene
		remove_child(current_scene)  # zamiast queue_free()
	current_scene = esc_scene.instantiate()
	add_child(current_scene)

func set_players():
	if awaiting_game_scene == null:
		awaiting_game_scene = game_scene.instantiate()
	if current_scene:
		current_scene.queue_free()
	current_scene = awaiting_game_scene
	add_child(current_scene)

func set_resume():
	if awaiting_game_scene:
		if current_scene:
			remove_child(current_scene)
		current_scene = awaiting_game_scene  # nie instantiate!
		add_child(current_scene)

func switch_to_shop():
	if current_scene:
		if current_scene != awaiting_game_scene:
			awaiting_game_scene = current_scene
		remove_child(current_scene)  # zamiast queue_free()
	current_scene = shop_scene.instantiate()
	add_child(current_scene)

func switch_to_trade():
	if current_scene:
		if current_scene != awaiting_game_scene:
			awaiting_game_scene = current_scene
		remove_child(current_scene)  # zamiast queue_free()
	current_scene = trade_scene.instantiate()
	add_child(current_scene)

func set_game():
	if current_scene:
		current_scene.queue_free()
	current_scene = scene1.instantiate()
	add_child(current_scene)
	awaiting_game_scene = null

func generate_board():
	pass
