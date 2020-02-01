extends KinematicBody2D

# https://godotengine.org/qa/25897/2d-platformer-how-to-control-jump-height-mario-like-jumps

#AnimationPlayer
onready var animationPlayer = $AnimationPlayer

#Jump 
export var fall_gravity_scale := 150.0
export var low_jump_gravity_scale := 100.0
export var jump_power := 500.0
export var move_speed := 350.0
var jump_released = false

#Physics
var velocity = Vector2()
var earth_gravity = 9.807 # m/s^2
export var gravity_scale := 100.0
var on_floor = false

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_just_released("jump"):
		jump_released = true

	#Applying gravity to player
	velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta

	var inAir = false

	if (velocity.y != 0 and not is_on_floor()):
		inAir = true

	#Jump Physics
	if velocity.y > 0: #Player is falling
		#Falling action is faster than jumping action | Like in mario
		#On falling we apply a second gravity to the player
		#We apply ((gravity_scale + fall_gravity_scale) * earth_gravity) gravity on the player
		velocity += Vector2.DOWN * earth_gravity * fall_gravity_scale * delta

	elif velocity.y < 0 && jump_released: #Player is jumping 
		#Jump Height depends on how long you will hold key
		#If we release the jump before reaching the max height 
		#We apply ((gravity_scale + low_jump_gravity_scale) * earth_gravity) gravity on the player
		#It result on a lower jump
		velocity += Vector2.DOWN * earth_gravity * low_jump_gravity_scale * delta
		
	var factor = 1
	
	if not (is_on_floor()):
		factor = 0.75
	
	if (Input.is_action_pressed("right")):
		velocity.x += move_speed * factor
		
		if not inAir:
			animationPlayer.play("moveRight")
	
	if (Input.is_action_pressed("left")):
		velocity.x -= move_speed * factor
		
		if not inAir:
			animationPlayer.play("moveLeft")

	if (is_on_floor() and velocity.x == 0 and not inAir):
		animationPlayer.play("idle")
	
	if on_floor:
		if Input.is_action_just_pressed("jump"): 
			velocity = Vector2.UP * jump_power #Normal Jump action
			jump_released = false
			animationPlayer.play("jump")
	
	if inAir:
		if (velocity.x > 0):
			$character.flip_h = false
		elif (velocity.x < 0):
			$character.flip_h = true
	
	velocity = move_and_slide(velocity, Vector2.UP, true) 
	
	if is_on_floor(): on_floor = true
	else: on_floor = false
