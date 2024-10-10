extends Sprite2D
var last_completed_tile = ""
var tiel
var raenge

# Called when the node enters the scene tree for the first time.
func _ready():
	_generate_new_tile() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_sprite():
	if last_completed_tile == "Boss Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Boss Tile/Boss Tile.png")
	elif last_completed_tile == "New Note Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/New Note Tile/New Note Tile.png")
	elif last_completed_tile == "Note Downgrade Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Note 'Downgrade' Tile/Note 'Downgrade' Tile.png")
	elif last_completed_tile == "Note Upgrade Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Note Upgrade Tile/Note Upgrade Tile.png")
	elif last_completed_tile == "Shop Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Shop Tile/Shop Tile.png")
	elif last_completed_tile == "Song Title":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Song Tile/Song Tile.png")
	change_texture(tiel)
func change_texture(textur: Texture):
	set_texture(textur)
	
func _generate_new_tile():
	raenge = randi_range(0,5)
	if raenge == 0:
		last_completed_tile = "Boss Tile"
	elif raenge == 1:
		last_completed_tile = "New Note Tile"
	elif raenge == 2:
		last_completed_tile = "Note Downgrade Tile"
	elif raenge == 3:
		last_completed_tile = "Note Upgrade Tile"
	elif raenge == 4:
		last_completed_tile = "Shop Tile"
	elif raenge == 5:
		last_completed_tile = "Song Tile"
	
	print(last_completed_tile)
	change_texture(tiel)
