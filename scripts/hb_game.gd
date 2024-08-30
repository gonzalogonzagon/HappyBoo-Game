extends Node2D

@onready var t_game_over = $TGameOver

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	if !(%PathFollow2D == null):
		%PathFollow2D.progress_ratio = randf()
		new_mob.global_position = %PathFollow2D.global_position
		add_child(new_mob)

func _on_player_health_depleted():
	
	%GameOver.visible = true
	Engine.time_scale = 0.5
	t_game_over.start()

func _on_t_game_over_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
