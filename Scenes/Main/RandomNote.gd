extends Sprite2D
var last_completed_tile = ""
var tiel
var raenge
var tile_1 = Global.next_tiles[0]
var the_next_tile = Global.the_next_tile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.checkTiles()
	change_sprite_next()


func change_texture(textur: Texture):
	set_texture(textur)
	

func pick_textures():
	change_texture(tiel)


func change_sprite_next():
	if tile_1 == "Boss Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Boss Tile/Boss Tile.png")
		Global.UpTile = "Boss Tile"
	elif tile_1 == "New Note Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/New Note Tile/New Note Tile.png")
		Global.UpTile = "New Note Tile"
	elif tile_1 == "Note Downgrade Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Note 'Downgrade' Tile/Note 'Downgrade' Tile.png")
		Global.UpTile = "Note Downgrade Tile"
	elif tile_1 == "Note Upgrade Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Note Upgrade Tile/Note Upgrade Tile.png")
		Global.UpTile = "Note Upgrade Tile"
	elif tile_1 == "Shop Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Shop Tile/Shop Tile.png")
		Global.UpTile = "Shop Tile"
	elif tile_1 == "Song Tile":
		tiel = load("res://RoguelikeRhythmAssets/Tiles/Song Tile/TheSongTile.png")
		Global.UpTile = "Song Tile"
	change_texture(tiel)
