extends Sprite2D

var boss_tile = ("res://RoguelikeRhythmAssets/Tiles/Boss Tile/Completed Boss Tile.png")
var new_note_tile = ("res://RoguelikeRhythmAssets/Tiles/New Note Tile/Completed New Note Tile.png")
var note_downgrade_tile = ("res://RoguelikeRhythmAssets/Tiles/Note 'Downgrade' Tile/Completed Note 'Downgrade' Tile.png")
var note_upgrade_tile = ("res://RoguelikeRhythmAssets/Tiles/Note Upgrade Tile/Completed Note Upgrade Tile.png")
var shop_tile = ("res://RoguelikeRhythmAssets/Tiles/Shop Tile/Completed Shop Tile.png")
var song_tile = ("res://RoguelikeRhythmAssets/Tiles/Song Tile/Completed Song Tile.png")

var last_completed_tile = Global.last_completed_tile

# Called when the node enters the scene tree for the first time.
func _ready():
	set_texture(last_completed_tile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_texture(last_completed_tile)
