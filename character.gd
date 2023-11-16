extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -275.0

@onready var healthbar: ProgressBar = get_node("ProgressBar2")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite: Sprite2D = get_node("NewPiskel(5)")

@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		sprite.frame = 0
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.frame = 4
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			sprite.frame = 2
		if direction == -1:
			sprite.frame = 9
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
	
	
func collect():
	Global.score += 1
	print(Global.score)
	
	
func delete():
	healthbar.update()
	
	

