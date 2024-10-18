extends Sprite2D
var characrterization
var startYPos = 344
var startXPos = 661
var newYPos : int
var newXPos : int
var i
var count
var count2
var hasCompleted

# Called when the node enters the scene tree for the first time.
func _ready():
	load_character() # Replace with function body.
	self.position = Vector2(startXPos, startYPos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_character()

#Loads the character sprite
func load_character():
	if Global.run_character == "Greg":
		characrterization = load("res://RoguelikeRhythmAssets/Characters/Greg/Greg.png")
	elif Global.run_character == "Eater of Cheetos":
		
		characrterization = load("res://RoguelikeRhythmAssets/Characters/Eater of Cheetos/EaterOfCheetos.png")
	else:
		visible = true
	set_texture(characrterization)

#Moves the Character
func move_character():
	if Global.directionPlayerGoing == "Up": #1027, 176
		move(1027, 176)
		await get_tree().create_timer(5).timeout
		checkBelowTile()
	elif Global.directionPlayerGoing == "Forward": #1035, 344
		move(1035, 344)
		await get_tree().create_timer(5).timeout
		checkBelowTile()
	elif Global.directionPlayerGoing == "Down": #1026, 513
		move(1026, 513)
		await get_tree().create_timer(5).timeout
		checkBelowTile()

#Moves the Character to a specific position
func move(newXPos, newYPos):
	var theCOfTheEquation = create_tween()
	theCOfTheEquation.tween_property(self, "position", Vector2(newXPos, newYPos), 1)
	

func checkBelowTile():
	if Global.directionPlayerGoing == "Up":
		if Global.UpTile == "Note Upgrade Tile" or Global.UpTile == "Note Downgrade Tile":
			if Global.UpTile == "Note Upgrade Tile":
				Global.last_completed_tile == Global.UpTile
			else:
				Global.last_completed_tile = Global.UpTile
			change_scene_to_card()
	elif Global.directionPlayerGoing == "Forward":
		if Global.ForwardTile == "Note Upgrade Tile" or Global.ForwardTile == "Note Downgrade Tile":
			if Global.ForwardTile == "Note Upgrade Tile":
				Global.last_completed_tile == Global.ForwardTile
			else:
				Global.last_completed_tile = Global.ForwardTile
			change_scene_to_card()
	elif Global.directionPlayerGoing == "Down":
		if Global.DownTile == "Note Upgrade Tile" or Global.DownTile == "Note Downgrade Tile":
			if Global.DownTile == "Note Upgrade Tile":
				Global.last_completed_tile == Global.DownTile
			else:
				Global.last_completed_tile = Global.DownTile
			change_scene_to_card()


func change_scene_to_card():
	get_tree().change_scene_to_file("res://Scenes/Main/CardScreen.tscn")
