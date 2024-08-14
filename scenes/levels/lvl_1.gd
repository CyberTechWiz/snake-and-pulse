#Lvl 1
# Собрать 10 яблок
extends Node2D

@export var apple_scene: PackedScene

signal main_menu
signal start_new_game
signal food_was_eaten
signal Update_ScoreLabel_on_game_over(score)
signal all_apple_score(score)
signal update_all_apple_score

var snake_data
var apples = []  # Глобальный массив для хранения ссылок на яблоки
var player

# сетка
var cells : int = 24
var cell_size : int = 20

var score = 0
var food_pos : Vector2
var regen_apples = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func playlvl1():
	$TileMap.show()
	$Apple.show()
	$"sidebar lvl1".show()
	$"ScoreLabel".show()
	$Background_music.play()
	$GameOverMenu.hide()
	$TaskCompleted.hide()
	# Получаем ссылку на узел player
	player = $Player
	#получаем данные о змейке из сцены игрока
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$Player.show()
	$TaskCompleted.hide()
	score = 0
	update_score(score)
	$Timer_chek_apple.start()
	emit_signal("start_new_game")
	move_apples()

func move_apples():
	snake_data = player.get_snake_data()
	while regen_apples:
		regen_apples = false
		food_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		for i in snake_data:
			if food_pos == i:
				regen_apples = true

	$Apple.position = (food_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_apples = true


func _on_player_game_over():
	emit_signal("Update_ScoreLabel_on_game_over", score)
	$GameOverMenu.show()
	$Timer_chek_apple.stop()
	emit_signal("all_apple_score", score)
	emit_signal("update_all_apple_score")
	


# Проверка на поедание еды (только яблоки)
func check_food_eaten():
	snake_data = player.get_snake_data()
	if snake_data[0] == food_pos:
		score += 1
		update_score(score)
		emit_signal("food_was_eaten")
		move_apples()
		

func _on_game_over_menu_restart():
	$GameOverMenu.hide()
	new_game()


func update_score(score):
	$ScoreLabel.text = str(score)
	if score == 10:
		$TaskCompleted.show()


func _on_timer_chek_apple_timeout():
	check_food_eaten()


func get_file_path_lvl() -> String:
	return "user://record_score_lvl1.txt"


func _on_game_over_menu_main_menu():
	$Player.hide()
	$Background_music.stop()
	$GameOverMenu.hide()
	emit_signal("main_menu")


func _on_main_menu_button_pressed():
	$Player.hide()
	$Background_music.stop()
	$GameOverMenu.hide()
	emit_signal("main_menu")
