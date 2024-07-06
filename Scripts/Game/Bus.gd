extends MeshInstance3D

var timer: float = 0

func _process(_dt):
	position += Vector3(-10,0,0) * _dt

	timer += _dt
	if timer > 300:
		queue_free()
