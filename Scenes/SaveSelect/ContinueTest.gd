extends Button

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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
