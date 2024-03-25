extends Camera3D
var look_sensitivity = 0.01
@onready var camera:Camera3D = %Camera3D 
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
	# sensitivity 0 code here somewhere
		if look_sensitivity != 0:
			look_sensitivity = 0
		else:
			look_sensitivity = ProjectSettings.get_setting("0.01")


func _input(event):
	# mouse sensitivity
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
