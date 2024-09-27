extends Node2D

var run_character: String = "Hero"
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

func _ready():
	#load_data_from_file("res://Data/Saves/Save Test/RunData.rrsv")
	# Example of modifying some data
	#vibe_points += 10
	#save_data_to_file("res://Data/Saves/Save Test/RunData.rrsv")
	pass

func load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()

		parse_rrsv_data(data)
	else:
		print("File not found: ", file_path)

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
		file.store_string("Vibe Points Max: %d\n" % vibe_points_max)
		file.store_string("Obtained Notes: %s\n" % array_to_string(obtained_notes))
		file.store_string("Cards Obtained: %s\n" % format_cards(cards_obtained))
		file.store_string("Save File Number: %s\n" % save_file_number)
		file.close()
	else:
		print("Failed to open file for writing: ", file_path)

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
