extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_Button_pressed")) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Button_pressed():
	Global.delete_data_from_file("res://Data/Saves/Save2/RunData.rrsv")
	Global.load_data_from_file("res://Data/Saves/SaveTest/EmptyData.rrsv")
	Global.save_data_to_file("res://Data/Saves/Save2/RunData.rrsv")
