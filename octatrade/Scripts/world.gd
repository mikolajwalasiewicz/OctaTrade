extends Node2D

var esc_scene = preload("res://Scenes/esc.tscn")
var scene1 = preload("res://Scenes/scene1.tscn")
var game_scene = preload("res://Scenes/game.tscn")
var shop_scene = preload("res://Scenes/shop.tscn")
var trade_scene = preload("res://Scenes/trade.tscn")

var awaiting_game_scene = null

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_scene = scene1.instantiate()
	add_child(current_scene)

func switch_to_esc():
	awaiting_game_scene = current_scene
	print(awaiting_game_scene)
	if current_scene:
		current_scene.queue_free()
	current_scene = esc_scene.instantiate()
	add_child(current_scene)

func set_players():
	if current_scene:
		current_scene.queue_free()
	current_scene = game_scene.instantiate()
	add_child(current_scene)
	
func set_resume():
	if current_scene:
		current_scene.queue_free()
	current_scene = game_scene.instantiate()
	add_child(current_scene)

func switch_to_shop():
	if current_scene:
		current_scene.queue_free()
	current_scene = shop_scene.instantiate()
	add_child(current_scene)

func switch_to_trade():
	if current_scene:
		current_scene.queue_free()
	current_scene = trade_scene.instantiate()
	add_child(current_scene)
	
func set_game():
	awaiting_game_scene = null
	if current_scene:
		current_scene.queue_free()
	current_scene = scene1.instantiate()
	add_child(current_scene)

func generate_board():
	pass
	
	
	
