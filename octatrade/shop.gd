#shop.gd
extends Node2D

@onready var variables = preload("res://variable.gd").new()
@onready var tilemap_resources = $"Tile Castle"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tilemap_resources.set_cell(Vector2i(-2,-5),variables.current_player-1, Vector2i(0,0))
	
	tilemap_resources.set_cell(Vector2i(-2,-4),variables.current_player-1, Vector2i(1,0))# castle


func _on_button_pressed() -> void:
	get_parent().set_players()
