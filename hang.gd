extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass





func _on_hang_body_entered(body: Node) -> void:
	if body != null:
		if body.name == "Player":
			if(body.velocity.x > 0):
				body.multiplier = 0.5


func _on_hang_body_exited(body: Node) -> void:
	if body != null:
		if body.name == "Player":
			body.multiplier = 1.0
