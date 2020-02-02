extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(true)

func _process(delta):
   if Input.is_action_pressed("exit"):
		  get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_hang_body_entered(body: Node) -> void:
	pass # Replace with function body.


func _on_hang_body_exited(body: Node) -> void:
	pass # Replace with function body.
