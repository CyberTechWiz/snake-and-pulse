extends CanvasLayer

signal restart
signal main_menu

var score = 0
var record_score = 0
var total_score_of_apples = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$RecordText2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Начинаем игру заново
func _on_replay_button_pressed():
	restart.emit()


#Перемещаемся в главное меню
func _on_main_menu_button_pressed():
	main_menu.emit()
	

#Обновляем счёт на экране конца иры
func _on_lvl_1_update_score_label_on_game_over(score):
	$ScoreLabel_on_game_over.text = str(score)
	# Загружаем текущий рекорд при запуске игры
	#record_score = load_record_score()
	#print("Current record loaded: ", record_score)
	if score > record_score:
		$Record.text = str(score)
	else:
		$Record.text = str(record_score)
	#save_record_score(score)


