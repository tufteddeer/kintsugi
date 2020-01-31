extends KinematicBody2D

export(float) var gravity = 200.0
export(float) var walk_speed = 200
export(float) var jump_power = 400.0

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * gravity

	print(is_on_floor())
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jump_power
		print("jump")
	if Input.is_action_pressed("left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0

	velocity = move_and_slide(velocity, Vector2(0, -1))
