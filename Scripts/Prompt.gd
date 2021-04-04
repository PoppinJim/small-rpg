extends AnimatedSprite

var hover


func _on_Area2D_mouse_entered():
	hover = true
	scale = Vector2(1.5, 1.5)
	print("Prompt: Mouse Detected")

func _on_Area2D_mouse_exited():
	hover = false
	scale = Vector2(1, 1)

func _physics_process(delta):
	pass
