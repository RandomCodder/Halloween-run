extends RigidBody2D

var og_pos
var dir = 1
var steps = 10

# Called when the node enters the scene tree for the first time.
@onready var sprite: Sprite2D = get_node("NewPiskel(8)")
func _ready():
	og_pos = position.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.x = position.x + dir
	
	
	if position.x > og_pos + steps:
		dir = -1
		sprite.frame = 41
	elif position.x < og_pos - steps:
		dir = 1
		sprite.frame = 44




func _on_area_2d_body_entered(body):
	if body.has_method("delete"):
		Global.score += 6
		queue_free()
		print(Global.score)
		
		


func _on_area_2d_2_body_entered(body):
	if body.has_method("delete"):
		Global.health -= 7
		body.delete()

