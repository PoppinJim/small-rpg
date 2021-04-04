extends Control

onready var dialogueBox = preload("res://Scenes/DialogueBox.tscn")
var diaBox
var currentLine = 0
var diaSize
var complete = true
var scriptReceived = false

signal COMPLETION


### will contain the dictionary that contains the lines of dialogue ( dispensable )
### remove preset later
var dialogueScript = []

func _initDialogue(script):
	complete = false
	currentLine = 0
	print("Signal Received?")
	scriptReceived = true
	
	dialogueScript = []
	
	dialogueScript = script
	

func _readLine(person, line):
	
	if diaBox: 
		diaBox.free()
	diaBox = dialogueBox.instance()
	add_child(diaBox)
	
	diaBox.Line = line
	diaBox.Person = person
	diaBox.readLine = true

func _terminateDia():
	diaBox.free()
	complete = true
	emit_signal("COMPLETION")

### BUILT IN FUNCTIONS
func _physics_process(delta):
	if scriptReceived:
		_readLine(dialogueScript[currentLine].Person, dialogueScript[currentLine].Text)
		currentLine += 1
		scriptReceived = false
	
	if diaBox:
		if diaBox.complete == true:
			if Input.is_action_just_pressed("ui_accept") && currentLine > 0:
				if currentLine < dialogueScript.size():
					_readLine(dialogueScript[currentLine].Person, dialogueScript[currentLine].Text)
					currentLine += 1
				elif currentLine >= dialogueScript.size() && diaBox:
					
					_terminateDia()
					
	
	
	
	
	
