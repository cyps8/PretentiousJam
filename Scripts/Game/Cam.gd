extends Camera3D

var screenSize: Vector2
var sensitivity = 0.3

@export var insideEnv: Environment
@export var outsideEnv: Environment

func _ready():
	screenSize = get_viewport().size

func _process(_delta):
	var mouseDelta = Input.get_last_mouse_velocity()
	rotation.y += deg_to_rad(-mouseDelta.x * sensitivity * _delta)
	rotation.x += deg_to_rad(-mouseDelta.y * sensitivity * _delta)
	rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))

	if global_position.z > 32.1:
		set_cull_mask_value(1, false)
		set_cull_mask_value(2, true)
		$Env.environment = insideEnv
	else:
		set_cull_mask_value(1, true)
		set_cull_mask_value(2, false)
		$Env.environment = outsideEnv