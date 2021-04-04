extends Node2D

onready var diaNodes = get_tree().get_nodes_in_group("diaNode")
onready var diaSys = $CanvasLayer/DialogueSystem




func _ready():
	for i in diaNodes:
		i.connect("startDialogue", diaSys, "_initDialogue")
	
		diaSys.connect("COMPLETION", i, "_isDiaComplete")

