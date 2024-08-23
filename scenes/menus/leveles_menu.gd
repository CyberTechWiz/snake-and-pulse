extends Node2D

signal playlvl1
signal playlvl2
signal playlvl3
signal playlvl4
signal playlvl5
signal playlvl6
signal playlvl7
signal playlvl8
signal playlvl9
signal playlvl10
signal playlvl11

signal hide_cross_button1
signal show_cross_button1

var num_of_lvl

# Called when the node enters the scene tree for the first time.
func _ready():
	$level1.hide()
	$level2.hide()
	$level3.hide()
	$level4.hide()
	$level5.hide()
	#$level6.hide()
	#$level7.hide()
	#$level8.hide()
	#$level9.hide()
	#$level10.hide()
	#$level11.hide()
	$play_button.hide()
	$cross_button2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_no_lvl_1_pressed():
	$level1.show()
	$play_button.show()
	$cross_button2.show()
	num_of_lvl = 1
	emit_signal("hide_cross_button1")


func _on_no_lvl_2_pressed():
	$level2.show()
	$cross_button2.show()
	$play_button.show()
	num_of_lvl = 2
	emit_signal("hide_cross_button1")

func _on_no_lvl_3_pressed():
	$level3.show()
	$cross_button2.show()
	$play_button.show()
	num_of_lvl = 3
	emit_signal("hide_cross_button1")

func _on_no_lvl_4_pressed():
	$level4.show()
	$cross_button2.show()
	$play_button.show()
	num_of_lvl = 4
	emit_signal("hide_cross_button1")

func _on_play_button_pressed():
	$play_button.hide()
	$cross_button2.hide()
	emit_signal("show_cross_button1")
	hide()
	if num_of_lvl ==  1:
		emit_signal("playlvl1")
		$level1.hide()
	elif num_of_lvl ==  2:
		emit_signal("playlvl2")
		$level2.hide()
	elif num_of_lvl ==  3:
		emit_signal("playlvl3")
		$level3.hide()
	elif num_of_lvl ==  4:
		emit_signal("playlvl4")
		$level4.hide()
	elif num_of_lvl ==  5:
		emit_signal("playlvl5")
		$level5.hide()
	elif num_of_lvl ==  6:
		emit_signal("playlvl6")
		$level6.hide()
	elif num_of_lvl ==  7:
		emit_signal("playlvl7")
		$level7.hide()
	elif num_of_lvl ==  8:
		emit_signal("playlvl8")
		$level8.hide()
	elif num_of_lvl ==  9:
		emit_signal("playlvl9")
		$level9.hide()
	elif num_of_lvl ==  10:
		emit_signal("playlvl10")
		$level10.hide()
	elif num_of_lvl ==  11:
		emit_signal("playlvl11")
		$level11.hide()


func _on_cross_button_2_pressed():
	emit_signal("show_cross_button1")
	$play_button.hide()
	$cross_button2.hide()
	if num_of_lvl ==  1:
		$level1.hide()
	elif num_of_lvl ==  2:
		$level2.hide()
	elif num_of_lvl ==  3:
		$level3.hide()
	elif num_of_lvl ==  4:
		$level4.hide()
	elif num_of_lvl ==  5:
		$level5.hide()
	elif num_of_lvl ==  6:
		$level6.hide()
	elif num_of_lvl ==  7:
		$level7.hide()
	elif num_of_lvl ==  8:
		$level8.hide()
	elif num_of_lvl ==  9:
		$level9.hide()
	elif num_of_lvl ==  10:
		$level10.hide()
	elif num_of_lvl ==  11:
		$level11.hide()
