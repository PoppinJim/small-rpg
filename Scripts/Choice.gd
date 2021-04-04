extends AnimatedSprite

var hovered = true
export(String) var option
signal chosenOption

func _on_Area2D_mouse_entered():
	scale = Vector2(1.5, 1.5)
	hovered = true
	emit_signal("chosenOption", option)

func _on_Area2D_mouse_exited():
	scale = Vector2(1, 1)
	hovered = false
	emit_signal("chosenOption", "CANCEL")

