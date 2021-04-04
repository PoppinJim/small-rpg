extends KinematicBody2D

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var SPEED = 125

onready var animationPlayer = $AnimationPlayer	
onready var animationTree = $AnimationTree
onready var animationState = $AnimationTree.get("parameters/playback")
onready var camPoint = $CameraPoint

onready var dialogueNode = $Dialogue

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

func _move():
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()
	velocity = direction * Vector2(SPEED, SPEED)
	velocity = move_and_slide(velocity)

func _animation():
	if direction != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", direction)
		animationTree.set("parameters/Run/blend_position", direction)
		animationState.travel("Run")
	else:
		animationState.travel("Idle")
		
func _ready():
	dialogueNode.talkingScript = _openJSON("res://JSON files/jade_talk_self.json")
	dialogueNode.observingScript = _openJSON("res://JSON files/jade_observe_self.json")
	pass

# warning-ignore:unused_argument
func _physics_process(delta):
	_move()
	_animation()
	camPoint.position = direction
		
	
		
