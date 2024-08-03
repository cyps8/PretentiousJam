extends CharacterBody3D

class_name Player
static var ins: Player

func _init():
	ins = self

const SPEED = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var cam: Camera3D

func _ready():
	cam = $Cam

func _physics_process(_dt):
	if not is_on_floor():
		velocity.y -= gravity * _dt

	var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction = (cam.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if position.x > 8000:
		position.x -= 16000
	elif position.x < -8000:
		position.x += 16000

	move_and_slide()
