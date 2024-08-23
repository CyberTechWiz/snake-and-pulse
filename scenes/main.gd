extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Main_menu.show()
	$lvl_1.hide()
	$lvl_2.hide()
	$lvl_3.hide()
	$lvl_4.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_playlvl_1():
	$Main_menu.hide()
	$lvl_1.show()

func _on_lvl_1_main_menu():	
	$Main_menu.show()
	$lvl_1.hide()


func _on_main_menu_playlvl_2():
	$Main_menu.hide()
	$lvl_2.show()

func _on_lvl_2_main_menu():
	$Main_menu.show()
	$lvl_2.hide()


func _on_main_menu_playlvl_3():
	$Main_menu.hide()
	$lvl_3.show()

func _on_lvl_3_main_menu():
	$Main_menu.show()
	$lvl_3.hide()


func _on_main_menu_playlvl_4():
	$Main_menu.hide()
	$lvl_4.show()

func _on_lvl_4_main_menu():
	$Main_menu.show()	
	$lvl_4.hide()


func _on_main_menu_playlvl_5():
	$Main_menu.hide()
	$lvl_5.show()

func _on_lvl_5_main_menu():
	$Main_menu.show()	
	$lvl_5.hide()


func _on_main_menu_playlvl_6():
	$Main_menu.hide()
	$lvl_6.show()

func _on_lvl_6_main_menu():
	$Main_menu.show()	
	$lvl_6.hide()


func _on_main_menu_playlvl_7():
	$Main_menu.hide()
	$lvl_7.show()

func _on_lvl_7_main_menu():
	$Main_menu.show()	
	$lvl_7.hide()


func _on_main_menu_playlvl_8():
	$Main_menu.hide()
	$lvl_8.show()

func _on_lvl_8_main_menu():
	$Main_menu.show()	
	$lvl_8.hide()


func _on_main_menu_playlvl_9():
	$Main_menu.hide()
	$lvl_9.show()

func _on_lvl_9_main_menu():
	$Main_menu.show()	
	$lvl_9.hide()
	
	
func _on_main_menu_playlvl_10():
	$Main_menu.hide()
	$lvl_10.show()

func _on_lvl_10_main_menu():
	$Main_menu.show()	
	$lvl_10.hide()


func _on_main_menu_playlvl_11():
	$Main_menu.hide()
	$lvl_11.show()

func _on_lvl_11_main_menu():
	$Main_menu.show()	
	$lvl_11.hide()
