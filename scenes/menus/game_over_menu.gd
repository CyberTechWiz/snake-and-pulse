extends CanvasLayer

signal restart
signal main_menu

var lvl
var score = 0
var record_score = 0
var file_path_lvl

# Called when the node enters the scene tree for the first time.
func _ready():
	lvl = get_parent() 
	if lvl != null:
		if lvl.has_method("get_file_path_lvl"):
			file_path_lvl = lvl.get_file_path_lvl()
		else:
			print("Parent node does not have method 'get_food_pos'")

	$RecordText2.hide()
	record_score = load_record_score()
	print("Current record loaded: ", record_score)

# Начинаем игру заново
func _on_replay_button_pressed():
	restart.emit()

# Перемещаемся в главное меню
func _on_main_menu_button_pressed():
	main_menu.emit()

# Обновляем счёт на экране конца игры
func _on_lvl_1_update_score_label_on_game_over(score):
	$ScoreLabel_on_game_over.text = str(score)
	if score > record_score:
		record_score = score
		$Record.text = str(score)
		save_record_score(score)  # Сохраняем новый рекорд
	else:
		$Record.text = str(record_score)

# Загрузка рекорда из файла
func load_record_score() -> int:
	if not file_path_lvl:
		print("Error: File path is not set.")
		return 0

	var file = FileAccess.open(file_path_lvl, FileAccess.READ)
	if file:
		if file.get_length() > 0:  # Проверяем, что файл не пуст
			record_score = file.get_line().to_int()
		file.close()
		return record_score
	else:
		print("Error: Unable to open file for reading.")
		return 0  # Возвращаем 0, если файл не существует или не удалось прочитать

# Сохранение рекорда в файл
func save_record_score(score: int) -> void:
	if not file_path_lvl:
		print("Error: File path is not set.")
		return

	var file = FileAccess.open(file_path_lvl, FileAccess.WRITE)
	if file:
		file.store_line(str(score))
		file.close()
	else:
		print("Error: Unable to open file for writing.")

