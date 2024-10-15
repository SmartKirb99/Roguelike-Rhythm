extends Sprite2D
var changery

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_if_keypress()
func check_if_keypress():
	
	if Input.is_action_pressed("up"):
		changery = load("res://RoguelikeRhythmAssets/Keys/Pressed Arrow Keys1.png")
	else:
		changery = load("res://RoguelikeRhythmAssets/Keys/Up Key Block.png")
	
	set_texture(changery)
