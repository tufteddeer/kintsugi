extends Node2D

var played = false
var played2 = false
onready var player1 = $titleplayer
onready var player2 = $AnimationPlayer



# warning-ignore:unused_argument
func _process(delta):
	
	if (not played2):
		player2.play("leertaste")
		played2 = true
		
	if (Input.is_action_pressed("jump") and not played):
		player1.play("title")
		player2.stop()
		$steuerung_leer.visible = not $steuerung_leer.visible
		player1.queue("bewegungstasten")
		played = true
	
func _on_titleplayer_animation_started(anim_name):
	if anim_name == "title":
		if (get_parent().get_node("Player") != null):
			get_parent().get_node("Player").game_started = true
