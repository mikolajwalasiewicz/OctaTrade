extends Node2D

@onready var ParallaxLayer1 = $ParallaxBackground/ParallaxLayer
@onready var Sprite2D1 = $ParallaxBackground/ParallaxLayer/Sprite2D
@onready var ParallaxLayer2 = $ParallaxBackground/ParallaxLayer2
@onready var Sprite2D2 = $ParallaxBackground/ParallaxLayer2/Sprite2D
@onready var ParallaxLayer3 = $ParallaxBackground/ParallaxLayer3
@onready var Sprite2D3 = $ParallaxBackground/ParallaxLayer3/Sprite2D
@onready var ParallaxLayer4 = $ParallaxBackground/ParallaxLayer4
@onready var Sprite2D4 = $ParallaxBackground/ParallaxLayer4/Sprite2D

var speed1 = Vector2(-1, 0)
var speed2 = Vector2(-2, 0)
var speed3 = Vector2(-3, 0)
var speed4 = Vector2(-4, 0)

func _process(delta: float) -> void:
	ParallaxLayer1.motion_offset += speed1 * delta
	ParallaxLayer2.motion_offset += speed2 * delta
	ParallaxLayer3.motion_offset += speed3 * delta
	ParallaxLayer4.motion_offset += speed4 * delta
	
	# Zapętlenie dla każdej warstwy (opcjonalne)
	if ParallaxLayer1.motion_offset.x > 1000:
		ParallaxLayer1.motion_offset.x = 0
	if ParallaxLayer2.motion_offset.x > 1000:
		ParallaxLayer2.motion_offset.x = 0
	if ParallaxLayer3.motion_offset.x > 1000:
		ParallaxLayer3.motion_offset.x = 0
	if ParallaxLayer4.motion_offset.x > 1000:
		ParallaxLayer4.motion_offset.x = 0
