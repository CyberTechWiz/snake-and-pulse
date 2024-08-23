extends CanvasLayer

var all_apple_score = 0

#signal playlvl # Для главногом меню
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

# Called when the node enters the scene tree for the first time.
func _ready():
	update_all_apple_score()
	$"leveles menu".hide()
	$cross_button1.hide()
	$game_descrip.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	$"leveles menu".show()
	$cross_button1.show()


func _on_leveles_menu_playlvl_1():
	$cross_button1.hide()
	emit_signal("playlvl1")


func _on_leveles_menu_playlvl_2():
	$cross_button1.hide()
	emit_signal("playlvl2")


func _on_leveles_menu_playlvl_3():
	$cross_button1.hide()
	emit_signal("playlvl3")

func _on_leveles_menu_playlvl_4():
	$cross_button1.hide()
	emit_signal("playlvl4")

func _on_leveles_menu_playlvl_5():
	$cross_button1.hide()
	emit_signal("playlvl5")

func _on_leveles_menu_playlvl_6():
	$cross_button1.hide()
	emit_signal("playlvl6")

func _on_leveles_menu_playlvl_7():
	$cross_button1.hide()
	emit_signal("playlvl7")

func _on_leveles_menu_playlvl_8():
	$cross_button1.hide()
	emit_signal("playlvl8")

func _on_leveles_menu_playlvl_9():
	$cross_button1.hide()
	emit_signal("playlvl9")

func _on_leveles_menu_playlvl_10():
	$cross_button1.hide()
	emit_signal("playlvl10")

func _on_leveles_menu_playlvl_11():
	$cross_button1.hide()
	emit_signal("playlvl11")

# Загрузка общего счёта яблок из файла
func load_all_apple_score() -> int:
	if not "user://apple_score.txt":
		print("Error: File path is not set.")
		return 0

	var file = FileAccess.open("user://apple_score.txt", FileAccess.READ)
	if file:
		if file.get_length() > 0:  # Проверяем, что файл не пуст
			all_apple_score = file.get_line().to_int()
		file.close()
		return all_apple_score
	else:
		print("Error: Unable to open file for reading.")
		return 0  # Возвращаем 0, если файл не существует или не удалось прочитать

# Сохранение рекорда в файл
func save_all_apple_score(score: int) -> void:
	if not "user://apple_score.txt":
		print("Error: File path is not set.")
		return

	var file = FileAccess.open("user://apple_score.txt", FileAccess.WRITE)
	if file:
		file.store_line(str(score))
		file.close()
	else:
		print("Error: Unable to open file for writing.")

func _on_lvl_1_all_apple_score(score):
	all_apple_score = all_apple_score + score 
	save_all_apple_score(all_apple_score)

# Обновление общего счёта яблок
func update_all_apple_score():
	all_apple_score = load_all_apple_score()
	$all_apple_score.text = str(all_apple_score)


func _on_cross_button_1_pressed():
	$"leveles menu".hide()
	$cross_button1.hide()


func _on_score_all_apples_pressed():
	$game_descrip.show()


func _on_cross_button_2_pressed():
	$game_descrip.hide()

func hide_cross_button1():
	$cross_button1.hide()
	
func show_cross_button1():
	$cross_button1.show()
