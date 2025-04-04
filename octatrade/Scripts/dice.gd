extends Node2D

var rand_num = 1
var rolling = false


func dice():
	# Prevent rolling if already rolling
	if rolling:
		return

	rolling = true
	randomize()
	rand_num = int(randf_range(2, 12))
	print(rand_num)
	
	# After 3 seconds, change the animation based on rand_num
	await get_tree().create_timer(1.5).timeout
	
	# Set the animation based on the rolled number
	match rand_num:
		2:
			$AnimatedSprite2D.play("2")
		3:
			$AnimatedSprite2D.play("3")
		4:
			$AnimatedSprite2D.play("4")
		5:
			$AnimatedSprite2D.play("5")
		6:
			$AnimatedSprite2D.play("6")
		7:
			$AnimatedSprite2D.play("7")
		8:
			$AnimatedSprite2D.play("8")
		9:
			$AnimatedSprite2D.play("9")
		10:
			$AnimatedSprite2D.play("10")
		11:
			$AnimatedSprite2D.play("11")
		12:
			$AnimatedSprite2D.play("12")
	
	rolling = false  # Allow the next roll after the animation finishes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rolling:
		$AnimatedSprite2D.play("roll")

func _on_button_pressed() -> void:
	dice()
