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


func _on_Collision_Trigger_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		if body.velocity.y > 0:
			get_parent().get_node("StaticBody2D/collision_polygon_platform").call_deferred("set_disabled", false)

