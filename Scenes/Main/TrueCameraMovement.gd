extends Marker3D

var rotating = false
var sensitivity = 0.5
var pitch = 0.0
var pitch_limit = 90.0



func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			rotating = event.pressed
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if rotating else Input.MOUSE_MODE_VISIBLE)
	elif event is InputEventMouseMotion and rotating:
		rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		pitch -= event.relative.y * sensitivity
		pitch = clamp(pitch, -pitch_limit, pitch_limit)
		$PitchNode.rotation_degrees.x = pitch
		

func _unhandled_input(event):
	if event is InputEventKey and Input.is_physical_key_pressed(KEY_ESCAPE):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		rotating = false
