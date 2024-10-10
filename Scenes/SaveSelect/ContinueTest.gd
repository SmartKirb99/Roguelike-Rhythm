extends Button

@export var ContinueTest: String = "T"

var run_character: String = "Template"
var new_note_tiles_complete: int = 0
var boss_tiles_complete: int = 0
var shop_tiles_complete: int = 0
var note_upgrade_tiles_complete: int = 0
var note_downgrade_tiles_complete: int = 0
var song_tiles_complete: int = 0
var vibe_points: int = 23
var vibe_points_max: int = 100
var obtained_notes: Array = ["Normal", "Money"]
var cards_obtained: Dictionary = {"Raise": 123, "Taxes": 1}
var save_file_number: String = "T"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "_on_Button_pressed"))
	load_data_from_file("res://Data/Saves/SaveTest/RunData.rrsv")

func _on_Button_pressed():
	Global.whatSave = "T"
	get_tree().change_scene_to_file("res://Scenes/Main/Run.tscn")
	Global.warn_save()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()

		Global.parse_rrsv_data(data)
	else:
		print("File not found: ", file_path)

