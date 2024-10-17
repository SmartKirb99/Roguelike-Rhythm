extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the button's pressed signal to the _on_Button_pressed function using Callable
	self.connect("pressed", Callable(self, "_on_Button_pressed"))

# Function to handle the button press
func _on_Button_pressed():
	Global.directionPlayerGoing = "Forward"
