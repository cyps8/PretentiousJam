extends Camera3D

var screenSize: Vector2
var sensitivity = 0.3

func _ready():
	screenSize = get_viewport().size

func _process(_delta):
	var mouseDelta = Input.get_last_mouse_velocity()
	rotation.y += deg_to_rad(-mouseDelta.x * sensitivity * _delta)
	rotation.x += deg_to_rad(-mouseDelta.y * sensitivity * _delta)
	rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))