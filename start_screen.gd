extends Node2D

var played = false

func _process(delta):
	if (Input.is_action_pressed("jump") and not played):
		$AnimationPlayer.play("fade")
		played = true
	
