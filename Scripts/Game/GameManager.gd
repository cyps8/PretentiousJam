extends Node3D

class_name GameManager
static var ins: GameManager

var paused: bool = false
var pauseMenu: PauseMenu

func _init():
	ins = self

func _ready():
	pauseMenu = get_node("Pause")
	pauseMenu.visible = true
	remove_child(pauseMenu)

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_dt):
	if Input.is_action_just_pressed("Pause"):
		Pause()

func Pause():
	paused = !paused
	get_tree().paused = paused
	if paused:
		add_child(pauseMenu)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		remove_child(pauseMenu)
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
