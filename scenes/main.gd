extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Main_menu.show()
	$lvl_1.hide()
	$lvl_2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lvl_1_main_menu():	
	$Main_menu.show()
	$lvl_1.hide()



func _on_main_menu_playlvl_1():
	$Main_menu.hide()
	$lvl_1.show()


func _on_main_menu_playlvl_2():
	$Main_menu.hide()
	$lvl_2.show()


func _on_lvl_2_main_menu():
	$Main_menu.show()
	$lvl_2.hide()
