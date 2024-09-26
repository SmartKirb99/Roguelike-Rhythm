extends TextEdit

func _ready():
	load_data_from_file("res://data.txt")
	update_text()

func load_data_from_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()

		# Split the file content into an array
		var data_array = data.split("\n")

		# Assuming the file has the correct number of lines for each global variable
		if data_array.size() >= 12:
			Global.run_character = data_array[0]
			Global.new_note_tiles_complete = data_array[1].to_int()
			Global.boss_tiles_complete = data_array[2].to_int()
			Global.shop_tiles_complete = data_array[3].to_int()
			Global.note_upgrade_tiles_complete = data_array[4].to_int()
			Global.note_downgrade_tiles_complete = data_array[5].to_int()
			Global.song_tiles_complete = data_array[6].to_int()
			Global.vibe_points = data_array[7].to_int()
			Global.vibe_points_max = data_array[8].to_int()
			Global.obtained_notes = data_array[9]
			Global.cards_obtained = data_array[10]
			Global.save_file_number = data_array[11]
		else:
			print("Error: Not enough data in the file.")
	else:
		print("File not found: ", file_path)

func update_text():
	var run_character = Global.run_character
	var new_note_tiles_complete = Global.new_note_tiles_complete
	var boss_tiles_complete = Global.boss_tiles_complete
	var shop_tiles_complete = Global.shop_tiles_complete
	var note_upgrade_tiles_complete = Global.note_upgrade_tiles_complete
	var note_downgrade_tiles_complete = Global.note_downgrade_tiles_complete
	var song_tiles_complete = Global.song_tiles_complete
	var vibe_points = Global.vibe_points
	var vibe_points_max = Global.vibe_points_max
	var obtained_notes = Global.obtained_notes
	var cards_obtained = Global.cards_obtained
	var save_file_number = Global.save_file_number

	# Set the text of the TextEdit node
	text = "Run Character: " + run_character + "\nNew Note Tiles Complete: " + str(new_note_tiles_complete) + "\nBoss Tiles Complete: " + str(boss_tiles_complete) + "\nShop Tiles Complete: " + str(shop_tiles_complete) + "\nNote Upgrade Tiles Complete: " + str(note_upgrade_tiles_complete) + "\nNote Downgrade Tiles Complete: " + str(note_downgrade_tiles_complete) + "\nSong Tiles Complete: " + str(song_tiles_complete) + "\nVibe Points: " + str(vibe_points) + "\nMax Vibe Points: " + str(vibe_points_max) + "\nObtained Notes: " + str(obtained_notes) + "\nCards Obtained: " + str(cards_obtained) + "\nSave File Number: " + str(save_file_number)
