#Lvl 2
# Собрать 20 яблок
extends Node2D

@export var apple_scene: PackedScene

signal main_menu
signal start_new_game
signal food_was_eaten
signal donut_was_eaten
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
var regen_donuts = true
var donut1_pos : Vector2
var donut2_pos : Vector2
var donut3_pos : Vector2
var donut4_pos : Vector2
var regen_apples = true
var timertim = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playlvl2():
	$TileMap.show()
	$Apple.show()
	$Donut1.show()
	$"sidebar lvl1".show()
	$"ScoreLabel".show()
	$Background_music.play()
	$GameOverMenu.hide()
	# Получаем ссылку на узел player
	player = $Player
	#получаем данные о змейке из сцены игрока
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$Player.show()
	timertim = 0
	$Timer_move_donut1.start()
	$Timer_move_donut2.start()
	$Timer_new_donut.start()
	$TaskCompleted.hide()
	score = 0
	update_score(score)
	$Timer_chek_apple.start()
	emit_signal("start_new_game")
	move_apples()
	move_donut1()

func move_apples():
	snake_data = player.get_snake_data()
	while regen_apples:
		regen_apples = false
		food_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut1_pos) or (food_pos == donut2_pos) or (food_pos == donut3_pos) or (food_pos == donut4_pos):
			regen_apples = true
		for i in snake_data:
			if food_pos == i:
				regen_apples = true

	$Apple.position = (food_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_apples = true

func move_donut1():
	snake_data = player.get_snake_data()
	while regen_donuts:
		regen_donuts = false
		donut1_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut1_pos) or (donut1_pos == donut2_pos) or (donut1_pos == donut3_pos) or (donut1_pos == donut4_pos):
			regen_apples = true
		for i in snake_data:
			if food_pos == i:
				regen_apples = true

	$Donut1.position = (donut1_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_donut2():
	snake_data = player.get_snake_data()
	while regen_donuts:
		regen_donuts = false
		donut2_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut2_pos) or (donut1_pos == donut2_pos) or (donut2_pos == donut3_pos) or (donut2_pos == donut4_pos):
			regen_apples = true
		for i in snake_data:
			if food_pos == i:
				regen_apples = true
	$Donut2.position = (donut2_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true
				
func move_donut3():
	snake_data = player.get_snake_data()
	while regen_donuts:
		regen_donuts = false
		donut3_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut3_pos) or (donut1_pos == donut3_pos) or (donut2_pos == donut3_pos) or (donut3_pos == donut4_pos):
			regen_apples = true
		for i in snake_data:
			if food_pos == i:
				regen_apples = true

	$Donut3.position = (donut3_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_donut4():
	snake_data = player.get_snake_data()
	while regen_donuts:
		regen_donuts = false
		donut4_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut4_pos) or (donut1_pos == donut4_pos) or (donut2_pos == donut4_pos) or (donut3_pos == donut4_pos):
			regen_apples = true
		for i in snake_data:
			if food_pos == i:
				regen_apples = true
				
	$Donut4.position = (donut4_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func _on_player_game_over():
	emit_signal("Update_ScoreLabel_on_game_over", score)
	emit_signal("all_apple_score", score)
	$GameOverMenu.show()
	$Timer_chek_apple.stop()
	$Timer_move_donut1.stop()
	$Timer_move_donut2.stop()
	$Timer_move_donut3.stop()
	$Timer_move_donut4.stop()
	emit_signal("update_all_apple_score")

# Проверка на поедание еды (только яблоки)
func check_food_eaten():
	snake_data = player.get_snake_data()
	if snake_data[0] == food_pos:
		score += 1
		update_score(score)
		emit_signal("food_was_eaten")
		move_apples()
	if snake_data[0] == donut1_pos:
		emit_signal("donut_was_eaten")
		move_donut1()
	if snake_data[0] == donut2_pos:
		emit_signal("donut_was_eaten")
		move_donut2()

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
	return "user://record_score_lvl2.txt"


func _on_game_over_menu_main_menu():
	$Player.hide()
	$Background_music.stop()
	$GameOverMenu.hide()
	$Timer_chek_apple.stop()
	$Timer_move_donut1.stop()
	$Timer_move_donut2.stop()
	$Timer_move_donut3.stop()
	$Timer_move_donut4.stop()
	emit_signal("main_menu")


func _on_main_menu_button_pressed():
	$Player.hide()
	$Background_music.stop()
	$GameOverMenu.hide()
	emit_signal("main_menu")

func _on_timer_move_donut_1_timeout():
	move_donut1()

func _on_timer_move_donut_2_timeout():
	move_donut2()

func _on_timer_move_donut_3_timeout():
	move_donut3()

func _on_timer_move_donut_4_timeout():
	move_donut4()



func _on_timer_new_donut_timeout():
	if timertim == 0:
		move_donut2()
		$Timer_move_donut2.start()
		timertim = 1
	elif timertim == 1:
		move_donut3()
		$Timer_move_donut3.start()
		timertim = 2
	elif timertim == 2:
		move_donut4()
		$Timer_move_donut4.start()
		timertim = 3
