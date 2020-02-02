extends Area2D

onready var canvas_mod = $"/root/Node2D/CanvasModulate"
onready var anim_player = $"/root/Node2D/ambient_light_player"

export (int) var area_id

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(body):
	if body.name == "Player":
		var anim_name = String(body.current_area) + "_to_" + String(area_id)
		anim_player.play(anim_name)
		body.current_area = area_id

