extends Button
var newYPos  = 825
var expectedYPos : int
#Y should be 325
#@onready var target = $"Target Point for Card 1"

#var targetPoint = target.position
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position=Vector2(self.position.x, 825) 
	self.connect("pressed", Callable(self, "_on_Button_pressed"))
	Global.UpTile = ""
	Global.ForwardTile = ""
	Global.DownTile = ""
	Global.directionPlayerGoing = "none"

# Function to handle the button press
func _on_Button_pressed():
	save()
	change_scene()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(162.5)


#Moves the Character to a specific position
func move(expectedYPos):
	var theCOfTheEquation = create_tween()
	theCOfTheEquation.tween_property(self, "position", Vector2(self.position.x, expectedYPos), 1)

#534.5, 819 (Card 2), 927, 817 (Card 3)
#
func change_scene():
	get_tree().change_scene_to_file("res://Scenes/Main/Run.tscn")

func save():
	if Global.whatSave == "1":
		Global.save_data_to_file("res://Data/Saves/Save1/RunData.rrsv")
	elif Global.whatSave == "2":
		Global.save_data_to_file("res://Data/Saves/Save2/RunData.rrsv")
	elif Global.whatSave == "3":
		Global.save_data_to_file("res://Data/Saves/Save3/RunData.rrsv")
	elif Global.whatSave == "T":
		Global.save_data_to_file("res://Data/Saves/SaveTest/RunData.rrsv")
