extends CollisionShape3D

@export var limit: float = 0.0

func _physics_process(_dt):
	global_position.x = Player.ins.global_position.x
	if limit > 0.0:
		if global_position.x < limit:
			global_position.x = limit
	elif limit < 0.0:
		if global_position.x > limit:
			global_position.x = limit
