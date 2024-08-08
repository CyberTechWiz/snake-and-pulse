extends Node2D

@export var food_type: String = "apple"

var food_pos : Vector2

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])



func _on_player_game_over():
	queue_free()


