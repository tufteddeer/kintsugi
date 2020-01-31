extends KinematicBody2D

export (Vector2) var gravity = Vector2(0, 200)
export (float) var jump_power = 10
export (float) var speed = 200
var velocity = Vector2()

onready var raycastL = $RayCastL
onready var raycastR = $RayCastR


var grounded = false
func _physics_process(delta):


	if Input.is_action_pressed('jump') and grounded:		
		velocity.y = jump_power * delta
	if Input.is_action_pressed('left'):		
		velocity.x -= speed * delta
	if Input.is_action_pressed('right'):		
		velocity.x += speed * delta
			
	var motion = velocity * delta
	velocity = move_and_slide(motion)
	
	grounded = raycastR.get_collider() != null or raycastL.get_collider() != null
	if grounded:
		velocity.y = 0
	print(grounded)
	print(velocity)
