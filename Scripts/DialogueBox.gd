extends TextureRect

onready var label = $Label
var readLine
var text = ""
var compiled = false
var complete = false


var currentLength
var nextLetter = true
var speed = .1
onready var timer = $Timer

var Person = "placeholder"
var Line = "placeholder"

onready var jadePortraits = preload("res://Sprites/jadePortraits.png")
onready var tobyPortraits = preload("res://Sprites/tobyPortraits.png")


func _ready():
	timer.start(speed)

func _compLine(person, line):

### WILL ARRANGE THE TEXT BASED ON GIVEN PARAMETERS
	
	currentLength = 0
	var TEXT = ""

	TEXT = TEXT.insert(currentLength, person)
	currentLength = TEXT.length()
	TEXT = TEXT.insert(currentLength, ": ")
	currentLength = TEXT.length()
	TEXT = TEXT.insert(currentLength, line)

	return TEXT
	

func _iterateChars(startText, addText):
	

	
	
	
	if nextLetter == true:
		currentLength = startText.length()
		if currentLength <= addText.length() - 1:
			startText = startText.insert(currentLength, addText[currentLength])
		else: complete = true
	
	nextLetter = false
	
	return startText


func _physics_process(delta):
	if compiled == false:
		text = _compLine(Person, Line)
		compiled = true
	
	label.text = _iterateChars(label.text, text)
	
	match Person:
		"Jade":
			$portrait.texture = jadePortraits
		"Toby":
			$portrait.texture = tobyPortraits
	
	if Input.is_action_just_pressed("ui_accept"):
		label.text = text
	
	pass



func _on_Timer_timeout():
	nextLetter = true
	pass
