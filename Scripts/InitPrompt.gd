extends Node2D

onready var animationPlayer = $AnimationPlayer
onready var bubbleChoices = get_tree().get_nodes_in_group("bubbleChoice")



var chosenOption = "CANCEL"

signal decided

func _evaluateChoice(choice):
	print("signal from bubbles received: ", choice)
	chosenOption = choice
	pass




func _ready():
	animationPlayer.play("STARTUP")
	for i in bubbleChoices:
		i.connect("chosenOption", self, "_evaluateChoice")
	
# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_just_released("Left_Click"):
		emit_signal("decided", chosenOption)
		free()

