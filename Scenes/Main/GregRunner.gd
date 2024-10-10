extends Sprite2D
var characrterization

# Called when the node enters the scene tree for the first time.
func _ready():
	load_character() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
		
func load_character():
	if Global.run_character == "Greg":
		characrterization = load("res://RoguelikeRhythmAssets/Characters/Greg/Greg.png")
	elif Global.run_character == "Eater of Cheetos":
		
		characrterization = load("res://RoguelikeRhythmAssets/Characters/Eater of Cheetos/EaterOfCheetos.png")
	else:
		visible = true
	set_texture(characrterization)
