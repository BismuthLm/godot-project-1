extends CharacterBody2D

signal laser(pos)
signal grenade(pos)

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$Timer.start()
		laser.emit(selected_laser.global_position)

	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$GrenadeReloadTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
		grenade.emit(pos)

func _on_timer_timeout():
	can_laser = true

func _on_grenade_reload_timer_timeout():
	can_grenade = true
