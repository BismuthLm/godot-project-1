extends CharacterBody2D

func _process(_delta):
	var direction = Vector2.RIGHT
	velocity = direction * 1000
	move_and_slide()
