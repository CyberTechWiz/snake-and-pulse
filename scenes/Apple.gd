extends Node2D

@export var food_type: String = "apple"


func _ready():
	$LifeTimer.start()
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


func _on_life_timer_timeout():
	queue_free()


func _on_player_game_over():
	queue_free()


