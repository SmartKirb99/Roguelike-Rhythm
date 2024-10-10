extends Button

# Public variable
var ContinueSave1: String = "1"

var run_character = "Guy"
var new_note_tiles_complete: int = 0
var boss_tiles_complete: int = 0
var shop_tiles_complete: int = 0
var note_upgrade_tiles_complete: int = 0
var note_downgrade_tiles_complete: int = 0
var song_tiles_complete: int = 0
var vibe_points: int = 23
var vibe_points_max: int = 100
var obtained_notes: Array = ["Normal"]
var cards_obtained: Dictionary = {}
var save_file_number: String = "1"



func _ready():
	self.connect("pressed", Callable(self, "_on_Button_pressed"))
	
	
func _on_Button_pressed():
	Global.whatSave = "1"
	load_data_from_file("res://Data/Saves/Save1/RunData.rrsv")
	get_tree().change_scene_to_file("res://Scenes/Main/Run.tscn")
	Global.warn_save()
	
	

func load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()
		Global.parse_rrsv_data(data)
	else:
		print("File not found: ", file_path)
