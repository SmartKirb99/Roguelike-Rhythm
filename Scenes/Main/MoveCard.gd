extends Sprite2D
var newYPos  = 825
var expectedYPos : int
#@onready var target = $"Target Point for Card 1"

#var targetPoint = target.position
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position=Vector2(self.position.x, 825) 
	#self.position = targetPoint # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_to_y(325)
	
func move_to_y(expectedYPos):
	while newYPos != expectedYPos or newYPos > expectedYPos:
		self.position=Vector2(self.position.x, newYPos)
		newYPos = newYPos - 20
		await get_tree().create_timer(0.5).timeout
		
