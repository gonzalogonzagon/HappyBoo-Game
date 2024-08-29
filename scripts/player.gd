extends CharacterBody2D

const SPEED = 600.0

func _physics_process(delta):
	var direction = Input.get_vector(
		"move_left","move_right","move_up","move_down"
									)
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
		
	if Input.is_action_just_pressed("shoot"):
		$Gun.shoot()
