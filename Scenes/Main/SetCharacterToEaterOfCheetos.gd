extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_Button_pressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Button_pressed():
	Global.run_character = "Eater of Cheetos"
	Global.obtained_notes = ["Cheeto"]
	Global.vibe_points = 100
	Global.vibe_points_max = 100
	if Global.newSave == "1":
		Global.save_file_number = "1"
		Global.save_data_to_file("res://Data/Saves/Save1/RunData.rrsv")
	elif Global.newSave == "2":
		Global.save_file_number = "2"
		Global.save_data_to_file("res://Data/Saves/Save2/RunData.rrsv")
	elif Global.newSave == "3":
		Global.save_file_number = "3"
		Global.save_data_to_file("res://Data/Saves/Save3/RunData.rrsv")
	elif Global.newSave == "T":
		Global.save_file_number = "T"
		Global.save_data_to_file("res://Data/Saves/SaveTest/RunData.rrsv")
	get_tree().change_scene_to_file("res://Scenes/Main/Run.tscn")
