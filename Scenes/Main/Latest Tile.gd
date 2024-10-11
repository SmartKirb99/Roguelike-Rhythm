extends Sprite2D
var textur
var last_completed_tile = Global.last_completed_tile

# Called when the node enters the scene tree for the first time.
func _ready():
	change_sprite()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func change_sprite():
	if last_completed_tile == "Boss Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/Boss Tile/Completed Boss Tile.png")
	elif last_completed_tile == "New Note Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/New Note Tile/Completed New Note Tile.png")
	elif last_completed_tile == "Note Downgrade Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/Note 'Downgrade' Tile/Completed Note 'Downgrade' Tile.png")
	elif last_completed_tile == "Note Upgrade Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/Note Upgrade Tile/Completed Note Upgrade Tile.png")
	elif last_completed_tile == "Shop Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/Shop Tile/Completed Shop Tile.png")
	elif last_completed_tile == "Song Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/Song Tile/Completed Song Tile.png")
	elif last_completed_tile == "Start Tile":
		textur = load("res://RoguelikeRhythmAssets/Tiles/Start Tile/StartTile.png")
	change_texture(textur)
func change_texture(textur: Texture):
	set_texture(textur)
