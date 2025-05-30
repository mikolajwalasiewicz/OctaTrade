extends Node2D

@onready var variables = preload("res://variable.gd").new()
@onready var tilemap_resources = $"Tile Castle"
@onready var label1 = $Label
@onready var label2 = $Label2
@onready var label3 = $Label3
@onready var label4 = $Label4
@onready var label5 = $"Tile Castle/Label4"
@onready var label6 = $"Tile Castle/Label5"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tilemap_resources.set_cell(Vector2i(-1,-1),variables.current_player-1, Vector2i(0,0))
	
	tilemap_resources.set_cell(Vector2i(1,-1),variables.current_player-1, Vector2i(1,0))# castle


	#label1.text = str(variables.players[variables.current_player - 1]["resource1"])
	label1.text = str(variables.players[variables.current_player - 1]["resource_1"])
	label2.text = str(variables.players[variables.current_player - 1]["resource_2"])
	label3.text = str(variables.players[variables.current_player - 1]["resource_3"])
	label4.text = str(variables.players[variables.current_player - 1]["resource_4"])
	label5.text = str(variables.players[variables.current_player - 1]["settlements_left"])
	label6.text = str(variables.players[variables.current_player - 1]["castles_left"])
