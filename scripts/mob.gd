extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")

func _ready():
	$Slime.play_walk()

func _physics_process(_delta):
	if !(player == null):
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 300.0
		move_and_slide()


func take_damage():
	health -= 1
	$Slime.play_hurt()
	
	if health == 0:
		queue_free()
		
		var smoke = load("res://smoke_explosion/smoke_explosion.tscn").instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
