extends KinematicBody2D

onready var dialogueNode = $Dialogue

var firstTalk = false


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

func _dialogueUsed(script):
	if script == dialogueNode.talkingScript:
		dialogueNode.talkingScript = _openJSON("res://JSON files/toby_talk.json")
		dialogueNode.observingScript = _openJSON("res://JSON files/toby_observe.json")
	
func _ready():
	dialogueNode.talkingScript = _openJSON("res://JSON files/toby_talk_first_time.json")
	dialogueNode.observingScript = _openJSON("res://JSON files/toby_observe_first_time.json")
	dialogueNode.connect("dialogueUsed", self,"_dialogueUsed")
	
