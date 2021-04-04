extends Node

var TobyCurrentDialogue = _openJSON("res://JSON files/toby_first_time.json")

var TobyGreeted = false

func _usedCurrentDialogue(script):
	TobyGreeted = true
	if script == TobyCurrentDialogue:
		TobyCurrentDialogue = _openJSON("res://JSON files/toby_neutral.json")
	pass

func _physics_process(delta):
	
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
