extends Node2D

onready var width = get_viewport().size.x

func _ready():
	update()

func _input(event):
	
	if event is InputEventScreenDrag:
		var dir = event.relative
		
		if dir.y < 0:
			Input.action_press("jump")
			print("jump")

	if event is InputEventScreenTouch:
		if event.pressed:
			if event.position.x < width * 0.5:
				Input.action_press("left")
			else:
				Input.action_press("right")
		else:
			Input.action_release("left")
			Input.action_release("right")
