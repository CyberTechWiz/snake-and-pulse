extends Node2D

@export var food_type: String = "donut"



@export var disappear_time: float = 0.5

var start_position: Vector2
var target_position: Vector2
var start_scale: Vector2
var start_time: float
var is_disappearing: bool = false



var food_pos : Vector2

func _ready():
	start_scale = scale
	#connect("body_entered", self, "_on_body_entered")


func _process(delta):
	if is_disappearing:
		var elapsed_time = (Time.get_ticks_msec() / 1000.0) - start_time
		var t = min(elapsed_time / disappear_time, 1.0)
		position = start_position.lerp(target_position, t)
		scale = start_scale.lerp(Vector2(0, 0), t)
		if t >= 1.0:
			queue_free()

func disappear_to(target_pos: Vector2):
	start_position = position
	target_position = target_pos
	start_time = Time.get_ticks_msec() / 1000.0
	is_disappearing = true

func _on_body_entered(body):
	if body.is_in_group("Snake"):
		disappear_to(body.position)
