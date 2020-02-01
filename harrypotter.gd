extends Polygon2D

export (int) var h_point_count = 5
export (float) var h_point_space = 100
export (float) var y_baseline

var vertices = PoolVector2Array()

func _ready():
	randomize()
		
	for i in range(1, h_point_count):
		vertices.append(Vector2(100*i,100 + rand_range(-30,30)))
	
	vertices.append(Vector2(100*h_point_count, 150))
	
	for j in range(vertices.size()-2, 0, -1):
		var v = vertices[j]
		vertices.append(Vector2(v.x, v.y+50))
	
	set_polygon(vertices)

	print(vertices)
	update()

func _draw():
	for v in vertices:
		draw_circle(v, 10, color)
