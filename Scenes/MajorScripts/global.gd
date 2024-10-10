extends Node

var whatSave = ""
var newSave = ""

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
var last_completed_tile = ""
var run_character2 = "Guy"
var new_note_tiles_complete2: int = 0
var boss_tiles_complete2: int = 0
var shop_tiles_complete2: int = 0
var note_upgrade_tiles_complete2: int = 0
var note_downgrade_tiles_complete2: int = 0
var song_tiles_complete2: int = 0
var vibe_points2: int = 23
var vibe_points_max2: int = 100
var obtained_notes2: Array = ["Normal"]
var cards_obtained2: Dictionary = {}
var save_file_number2: String = "1"
var last_completed_tile2 = ""
@onready var PopUpScene: PackedScene = preload("res://Scenes/Main/DeletionScene.tscn")
@onready var PopUpScene2: PackedScene = preload("res://Scenes/Main/WarnScreen.tscn")
var popup:Control
var popup2:Control
var w: Popup
var x: Popup
var view_port:Window
var viewport2:Window
var has_seen_warning = false


func _ready():
	has_seen_warning = false

# Called when the node enters the scene tree for the first time.
func load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()

		parse_rrsv_data(data)
	else:
		print("File not found: ", file_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if whatSave == "1":
		load_data_from_file("res://Data/Saves/Save1/RunData.rrsv")
	elif whatSave == "T":
		load_data_from_file("res://Data/Saves/SaveTest/RunData.rrsv")
	elif whatSave == "2":
		load_data_from_file("res://Data/Saves/Save2/RunData.rrsv")
	elif whatSave == "3":
		load_data_from_file("res://Data/Saves/Save3/RunData.rrsv")
	
	

func parse_rrsv_data(data: String):
	var lines = data.split("\n")
	for line in lines:
		var parts = line.split(":")
		if parts.size() == 2:
			var key = parts[0].strip_edges()
			var value = parts[1].strip_edges()
			match key:
				"Run Character":
					run_character = value
				"New Note Tiles Complete":
					new_note_tiles_complete = value.to_int()
				"Boss Tiles Complete":
					boss_tiles_complete = value.to_int()
				"Shop Tiles Complete":
					shop_tiles_complete = value.to_int()
				"Note Upgrade Tiles Complete":
					note_upgrade_tiles_complete = value.to_int()
				"Note Downgrade Tiles Complete":
					note_downgrade_tiles_complete = value.to_int()
				"Song Tiles Complete":
					song_tiles_complete = value.to_int()
				"Vibe Points":
					vibe_points = value.to_int()
				"Vibe Points Max":
					vibe_points_max = value.to_int()
				"Obtained Notes":
					obtained_notes = value.split(", ")
				"Cards Obtained":
					cards_obtained = parse_cards(value)
				"Save File Number":
					save_file_number = value
				"Last Completed Tile":
					last_completed_tile = value

func parse_cards(data: String) -> Dictionary:
	var cards = {}
	var card_entries = data.split(", ")
	for entry in card_entries:
		var card_parts = entry.split(" * ")
		if card_parts.size() == 2:
			var card_name = card_parts[0].strip_edges()
			var card_count = card_parts[1].to_int()
			cards[card_name] = card_count
	return cards

func save_data_to_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		file.store_string("Run Character: %s\n" % run_character)
		file.store_string("New Note Tiles Complete: %d\n" % new_note_tiles_complete)
		file.store_string("Boss Tiles Complete: %d\n" % boss_tiles_complete)
		file.store_string("Shop Tiles Complete: %d\n" % shop_tiles_complete)
		file.store_string("Note Upgrade Tiles Complete: %d\n" % note_upgrade_tiles_complete)
		file.store_string("Note Downgrade Tiles Complete: %d\n" % note_downgrade_tiles_complete)
		file.store_string("Song Tiles Complete: %d\n" % song_tiles_complete)
		file.store_string("Vibe Points: %d\n" % vibe_points)
		file.store_string("Max Vibe Points: %d\n" % vibe_points_max)
		file.store_string("Obtained Notes: %s\n" % array_to_string(obtained_notes))
		file.store_string("Cards Obtained: %s\n" % format_cards(cards_obtained))
		file.store_string("Save File Number: %s\n" % save_file_number)
		file.store_string("Last Completed Tile: %s\n" % last_completed_tile)
		file.close()
	else:
		print("Failed to open file for writing: ", file_path)
		
		
		
func delete_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		# Create a dictionary with the new data
		var new_data = {
		"Run Character": "YourCharacter",
		"New Note Tiles Complete": 0,
		"Boss Tiles Complete": 0,
		"Shop Tiles Complete": 0,
		"Note Upgrade Tiles Complete": 0,
		"Note Downgrade Tiles Complete": 0,
		"Song Tiles Complete": 0,
		"Vibe Points": 0,
		"Max Vibe Points": 0,
		"Obtained Notes": [],
		"Cards Obtained": [],
		"Save File Number": 1,
		"Last Completed Tile": "None"
		}
		
		# Convert the dictionary to JSON and write it to the file
		file.store_string(JSON.stringify(new_data))
		view_port=get_window()
		w=Popup.new()
		w.borderless = false
		w.unresizable = false
		w.size = view_port.size * 0.5
		w.position=(view_port.size - w.size) * 0.5
		w.exclusive = true
		w.popup_window = false
		w.name = "popup"
		w.visible = true
		w.transient = true
		
		popup = PopUpScene.instantiate()
		popup.position=Vector2i(0,0)
		popup.size = w.size
		
		w.add_child(popup)
		w.close_requested.connect(func():w.hide)
		view_port.add_child(w)
		file.close()
		
	else:
		print("Failed to open file for writing")
func hidden_delete_save(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		# Create a dictionary with the new data
		var new_data = {
		"Run Character": "YourCharacter",
		"New Note Tiles Complete": 0,
		"Boss Tiles Complete": 0,
		"Shop Tiles Complete": 0,
		"Note Upgrade Tiles Complete": 0,
		"Note Downgrade Tiles Complete": 0,
		"Song Tiles Complete": 0,
		"Vibe Points": 0,
		"Max Vibe Points": 0,
		"Obtained Notes": [],
		"Cards Obtained": [],
		"Save File Number": 1,
		"Last Completed Tile": "None"
		}
		file.close()

func array_to_string(arr: Array) -> String:
	var result = ""
	for i in range(arr.size()):
		result += arr[i]
		if i < arr.size() - 1:
			result += ", "
	return result

func format_cards(cards: Dictionary) -> String:
	var card_strings = []
	for card_name in cards.keys():
		card_strings.append("%s * %d" % [card_name, cards[card_name]])
	return array_to_string(card_strings)






func new_save_file():
	if newSave == "T":
		hidden_delete_save("res://Data/Saves/SaveTest/RunData.rrsv")
		load_data_from_file("res://Data/Saves/SaveTest/EmptyData.rrsv")
		save_data_to_file("res://Data/Saves/SaveTest/RunData.rrsv")
	elif newSave == "1":
		hidden_delete_save("res://Data/Saves/Save1/RunData.rrsv")
		load_data_from_file("res://Data/Saves/SaveTest/EmptyData.rrsv")
		save_data_to_file("res://Data/Saves/Save1/RunData.rrsv")
	elif newSave == "2":
		hidden_delete_save("res://Data/Saves/Save2/RunData.rrsv")
		load_data_from_file("res://Data/Saves/SaveTest/EmptyData.rrsv")
		save_data_to_file("res://Data/Saves/Save2/RunData.rrsv")
	elif newSave == "3":
		hidden_delete_save("res://Data/Saves/Save3/RunData.rrsv")
		load_data_from_file("res://Data/Saves/SaveTest/EmptyData.rrsv")
		save_data_to_file("res://Data/Saves/Save3/RunData.rrsv")
	get_tree().change_scene_to_file("res://Scenes/Main/CharacterSelection.tscn")
func warn_save():
	if has_seen_warning == false:
		view_port=get_window()
		w=Popup.new()
		w.borderless = false
		w.unresizable = false
		w.size = view_port.size * 0.5
		w.position=(view_port.size - w.size) * 0.5
		w.exclusive = true
		w.popup_window = false
		w.name = "popup"
		w.visible = true
		w.transient = true
		
		popup = PopUpScene2.instantiate()
		popup.position=Vector2i(0,0)
		popup.size = w.size
		
		w.add_child(popup)
		w.close_requested.connect(func():w.hide)
		view_port.add_child(w)
		
		has_seen_warning = true
	else:
		pass
func load_data_from_file_alt(file_path: String):
	var file2 = FileAccess.open(file_path, FileAccess.READ)
	if file2:
		var data2 = file2.get_as_text()
		file2.close()

		parse_rrsv_data_alt(data2)
	else:
		print("File not found: ", file_path)
func parse_rrsv_data_alt(data: String):
	var lines2 = data.split("\n")
	for line in lines2:
		var parts = line.split(":")
		if parts.size() == 2:
			var key2 = parts[0].strip_edges()
			var value2 = parts[1].strip_edges()
			match key2:
				"Run Character2":
					run_character2 = value2
				"New Note Tiles Complete2":
					new_note_tiles_complete2 = value2.to_int()
				"Boss Tiles Complete2":
					boss_tiles_complete2 = value2.to_int()
				"Shop Tiles Complete2":
					shop_tiles_complete2 = value2.to_int()
				"Note Upgrade Tiles Complete2":
					note_upgrade_tiles_complete2 = value2.to_int()
				"Note Downgrade Tiles Complete2":
					note_downgrade_tiles_complete2 = value2.to_int()
				"Song Tiles Complete2":
					song_tiles_complete2 = value2.to_int()
				"Vibe Points2":
					vibe_points2 = value2.to_int()
				"Vibe Points Max2":
					vibe_points_max2 = value2.to_int()
				"Obtained Notes2":
					obtained_notes2 = value2.split(", ")
				"Cards Obtained2":
					cards_obtained2 = parse_cards(value2)
				"Save File Number2":
					save_file_number2 = value2
				"Last Completed Tile2":
					last_completed_tile2 = value2
func tryComparison():
	load_data_from_file_alt("res://Data/Saves/SaveTest/EmptyData.rrsv")
	if whatSave == "1":
		load_data_from_file("res://Data/Saves/Save1/RunData.rrsv")
	elif whatSave == "2":
		load_data_from_file("res://Data/Saves/Save2/RunData.rrsv")
	elif whatSave == "3":
		load_data_from_file("res://Data/Saves/Save3/RunData.rrsv")
	elif whatSave == "T":
		load_data_from_file("res://Data/Saves/SaveTest/RunData.rrsv")
	
