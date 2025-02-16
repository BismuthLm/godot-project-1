extends Node2D

var test_array: Array[String] = ["Test", "Hello", "stuff"]

func _ready():
	$Icon.rotation_degrees = 90
	
	print(test_array[0])

func _process(delta):
	$Icon.rotation_degrees += 60 * delta
	
	if $Icon.position.x > 1000:
		$Icon.pos.x = 0
		
	#print(Input.is_action_pressed("left"))
