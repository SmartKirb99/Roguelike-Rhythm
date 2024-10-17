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
	if Global.directionPlayerGoing == "Up":
		y_move_character(176)
		await get_tree().create_timer(0.5).timeout
		x_move_character(1027)
	elif Global.directionPlayerGoing == "Forward":
		x_move_character(1035)
	elif Global.directionPlayerGoing == "Down":
		y_move_character(513)
		x_move_character(1026)
#Moves the Character's Y Position
func y_move_character(newYPos):
	i = startYPos
	while i != newYPos or i > newYPos:
		self.position=Vector2(self.position.x,i)
		if Global.directionPlayerGoing == "Up":
			i = i - 1
		elif Global.directionPlayerGoing == "Down":
			i = i + 1
		await get_tree().create_timer(0.001).timeout
		hasCompleted = false
	hasCompleted = true


#Moves the Character's X Position
func x_move_character(newXPos):
	i = startXPos
	while i != newXPos or i > newXPos:
		self.position=Vector2(i, self.position.y)
		i = i + 1
		await get_tree().create_timer(0.001).timeout

func moveDiagonally(newXPos, newYPos):
	
