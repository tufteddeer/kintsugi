extends Polygon2D

onready var line = $Line2D
onready var collision_polygon = $StaticBody2D/collision_polygon_platform
onready var collision_polygon_area = $Collision_Trigger/collision_polygon_area

export (int) var h_point_count = 5
var width

# distance between to vertical points
export (float) var v_offset = 10
export (float) var v_offset_trigger = 2

export (int) var y_min_offset = -30
export (int) var y_max_offset = 30

var vertices = PoolVector2Array()

func _ready():
	line.visible = false
	randomize()
	
	var line_start = line.points[0]
	var line_end = line.points[1]

	width = line_start.distance_to(line_end)
	
	var h_space = width / (h_point_count - 1)
	
	vertices.append(line_start)
	
	for i in range(1, h_point_count-1):
		vertices.append(Vector2(h_space * i,0 + rand_range(y_min_offset, y_max_offset)))
	
	vertices.append(line_end)
	
	var trigger_vertices = vertices
	
	for j in range(vertices.size()-2, 0, -1):
		var v = vertices[j]
		vertices.append(Vector2(v.x, v.y + v_offset))
	
	trigger_vertices.append(Vector2(line_end.x, line_end.y + v_offset_trigger))
	
	for j in range(trigger_vertices.size()-2, 0, -1):
		var v = trigger_vertices[j]
		trigger_vertices.append(Vector2(v.x, v.y + v_offset_trigger))
		
	trigger_vertices.append(Vector2(line_start.x, line_end.y + v_offset_trigger))
	
	set_polygon(vertices)
	collision_polygon.set_polygon(vertices)
	collision_polygon_area.set_polygon(trigger_vertices)
	$Collision_Trigger.position.y += -5
