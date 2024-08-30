extends CharacterBody2D

const SPEED = 600.0
const DAMAGE_RATE = 10.0

signal health_depleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector(
		"move_left","move_right","move_up","move_down")
	var overlaping_mobs = %HurtBox.get_overlapping_bodies()
	
	if Input.is_action_just_pressed("shoot"):
		$Gun.shoot()
	
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
	
	if overlaping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlaping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			Engine.time_scale = 0.5
			queue_free()
		
			var smoke = load("res://smoke_explosion/smoke_explosion.tscn").instantiate()
			get_parent().add_child(smoke)
			smoke.global_position = global_position
			
			health_depleted.emit()
