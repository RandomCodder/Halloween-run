extends ProgressBar

@export var player: CharacterBody2D



func update():
	print("hi")
	value = Global.health * 100 / max_value
	
