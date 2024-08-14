extends Node2D

signal playlvl1
signal playlvl2
signal playlvl3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_no_lvl_1_pressed():
	emit_signal("playlvl1")


func _on_no_lvl_2_pressed():
	emit_signal("playlvl2")


func _on_no_lvl_3_pressed():
	emit_signal("playlvl3")
