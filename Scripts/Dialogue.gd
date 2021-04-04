extends Node2D

var canClick = false
var line = 0
var talkingScript
var observingScript
var lock = false
var intBubbles

onready var prompt = preload("res://Scenes/InitPrompt.tscn")


signal startDialogue
signal dialogueUsed



func _ready():
	pass

func _openJSON(path):
	var data_file = File.new()
	if data_file.open(path, File.READ) != OK:
		return
	var data_text = data_file.get_as_text()
	data_file.close()
	var data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		return
	var data = data_parse.result
	return data
	pass

func _on_Area2D_mouse_entered():
	print("Mouse Entered")
	canClick = true
	
func _on_Area2D_mouse_exited():
	print("Mouse Exited")
	canClick = false

func _isDiaComplete():

	lock = false

func _physics_process(delta):
	if canClick && lock == false && Input.is_action_just_pressed("Left_Click"):
		lock = true
		
		intBubbles = prompt.instance()
		intBubbles.position.y = -50
		add_child(intBubbles)
		intBubbles.connect("decided", self, "_evaluateOption")
		
	
func _evaluateOption(choice):
	print("signal received?: ", choice)
	match choice:
		"TALK":
			emit_signal("startDialogue", talkingScript)
			emit_signal("dialogueUsed", talkingScript)
			lock = true
		"OBSERVE":
			emit_signal("startDialogue", observingScript)
			emit_signal("dialogueUsed", observingScript)
			lock = true
		"CANCEL":
			lock = false
			pass
	
	

