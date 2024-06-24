extends CharacterBody3D

@export var speed = 14
@export var jump = 4
@export var mouse_sensitivity = 0.002

var target_velocity = Vector3.ZERO
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var rot_x = 0
var rot_y = 0

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if Input.is_action_pressed("jump") and is_on_floor():
		target_velocity.y = jump

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (gravity * delta)

	velocity = target_velocity



	move_and_slide()

	
