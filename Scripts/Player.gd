extends CharacterBody2D

@onready var sword_prefab = preload("res://Prefabs/sword.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
		
func _process(delta):
	if Input.is_action_just_pressed("attack_right"):
		var sword = sword_prefab.instantiate()
		sword.position = position
		get_parent().add_child(sword)
	if Input.is_action_just_pressed("attack_left"):
		var sword = sword_prefab.instantiate()
		sword.position = position
		sword.position.x -= 1
		sword.scale.x = -1.000001
		get_parent().add_child(sword)
	if Input.is_action_just_pressed("attack_up"):
		print("ow")
		var sword = sword_prefab.instantiate()
		sword.position = position
		sword.position.x -= 1
		sword.scale.x = -1
		get_parent().add_child(sword)

