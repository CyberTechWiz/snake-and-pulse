#Lvl 4
# Собрать 15 яблок
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
var donut5_pos : Vector2
var rdonut1_pos : Vector2
var rdonut2_pos : Vector2
var rdonut3_pos : Vector2
var rdonut4_pos : Vector2
var rdonut5_pos : Vector2
var regen_apples = true
var timertim = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playlvl4():
	$TileMap.show()
	$Apple.show()
	$Donut1.show()
	$Donut2.show()
	$Donut3.show()
	$Donut4.show()
	$Donut5.show()
	$rDonut1.show()
	$rDonut2.show()
	$rDonut3.show()
	$rDonut4.show()
	$rDonut5.show()
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
	$Donut2.position = Vector2(-10, -10)
	$Donut3.position = Vector2(-10, -10)
	$Donut4.position = Vector2(-10, -10)
	$Donut5.position = Vector2(-10, -10)
	$rDonut2.position = Vector2(-10, -10)
	$rDonut3.position = Vector2(-10, -10)
	$rDonut4.position = Vector2(-10, -10)
	$rDonut5.position = Vector2(-10, -10)
	$Player.show()
	timertim = 1
	$Timer_move_donut1.start()
	$Timer_new_donut.start()
	$TaskCompleted.hide()
	score = 0
	update_score(score)
	$Timer_chek_apple.start()
	emit_signal("start_new_game")
	move_apples()
	move_donut1()
	move_rdonut1()

func move_apples():
	snake_data = player.get_snake_data()
	regen_apples = true
	while regen_apples:
		regen_apples = false
		food_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut1_pos) or (food_pos == donut2_pos) or (food_pos == donut3_pos) or (food_pos == donut4_pos) or (food_pos == donut5_pos):
			regen_apples = true
		for i in snake_data:
			if food_pos == i:
				regen_apples = true

	$Apple.position = (food_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_apples = true

func move_donut1():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		donut1_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut1_pos) or (donut1_pos == donut2_pos) or (donut1_pos == donut3_pos) or (donut1_pos == donut4_pos) or (donut1_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true

	$Donut1.position = (donut1_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_donut2():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		donut2_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut2_pos) or (donut1_pos == donut2_pos) or (donut2_pos == donut3_pos) or (donut2_pos == donut4_pos) or (donut2_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true
	$Donut2.position = (donut2_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true
				
func move_donut3():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		donut3_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut3_pos) or (donut1_pos == donut3_pos) or (donut2_pos == donut3_pos) or (donut3_pos == donut4_pos) or (donut3_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true

	$Donut3.position = (donut3_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_donut4():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		donut4_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut4_pos) or (donut1_pos == donut4_pos) or (donut2_pos == donut4_pos) or (donut3_pos == donut4_pos) or (donut4_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true
				
	$Donut4.position = (donut4_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_donut5():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		donut5_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (food_pos == donut5_pos) or (donut1_pos == donut5_pos) or (donut2_pos == donut5_pos) or (donut3_pos == donut5_pos) or (donut4_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true
				
	$Donut5.position = (donut5_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true





func move_rdonut1():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		rdonut1_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (rdonut1_pos == donut1_pos) or (rdonut1_pos == donut2_pos) or (rdonut1_pos == donut3_pos) or (rdonut1_pos == donut4_pos) or (rdonut1_pos == donut5_pos):
			regen_donuts = true
		if (food_pos == rdonut1_pos) or (rdonut1_pos == rdonut2_pos) or (rdonut1_pos == rdonut3_pos) or (donut1_pos == donut4_pos) or (donut1_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true

	$rDonut1.position = (rdonut1_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_rdonut2():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		rdonut2_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (rdonut2_pos == donut1_pos) or (rdonut2_pos == donut2_pos) or (rdonut2_pos == donut3_pos) or (rdonut2_pos == donut4_pos) or (rdonut2_pos == donut5_pos):
			regen_donuts = true
		if (food_pos == rdonut2_pos) or (rdonut1_pos == rdonut2_pos) or (rdonut2_pos == rdonut3_pos) or (donut2_pos == donut4_pos) or (donut2_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true
	$rDonut2.position = (rdonut2_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true
				
func move_rdonut3():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		rdonut3_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (rdonut3_pos == donut1_pos) or (rdonut3_pos == donut2_pos) or (rdonut3_pos == donut3_pos) or (rdonut3_pos == donut4_pos) or (rdonut3_pos == donut5_pos):
			regen_donuts = true
		if (food_pos == rdonut3_pos) or (rdonut3_pos == rdonut1_pos) or (rdonut3_pos == rdonut2_pos) or (donut3_pos == donut4_pos) or (donut3_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true

	$rDonut3.position = (rdonut3_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_rdonut4():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		rdonut4_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (rdonut4_pos == donut1_pos) or (rdonut4_pos == donut2_pos) or (rdonut4_pos == donut3_pos) or (rdonut4_pos == donut4_pos) or (rdonut4_pos == donut5_pos):
			regen_donuts = true
		if (food_pos == rdonut4_pos) or (rdonut4_pos == rdonut1_pos) or (rdonut4_pos == rdonut2_pos) or (donut4_pos == donut3_pos) or (donut4_pos == donut5_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true
				
	$rDonut4.position = (rdonut4_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_donuts = true

func move_rdonut5():
	snake_data = player.get_snake_data()
	regen_donuts = true
	while regen_donuts:
		regen_donuts = false
		rdonut5_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		if (rdonut5_pos == donut1_pos) or (rdonut5_pos == donut2_pos) or (rdonut5_pos == donut3_pos) or (rdonut5_pos == donut4_pos) or (rdonut5_pos == donut5_pos):
			regen_donuts = true
		if (food_pos == rdonut5_pos) or (rdonut5_pos == rdonut1_pos) or (rdonut5_pos == rdonut2_pos) or (donut5_pos == donut3_pos) or (donut5_pos == donut4_pos):
			regen_donuts = true
		for i in snake_data:
			if food_pos == i:
				regen_donuts = true
				
	$rDonut5.position = (rdonut5_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
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
	$Timer_move_donut5.stop()
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
		$Player.end_game()
	if snake_data[0] == donut2_pos:
		$Player.end_game()
	if snake_data[0] == donut3_pos:
		$Player.end_game()
	if snake_data[0] == donut4_pos:
		$Player.end_game()
	if snake_data[0] == donut5_pos:
		$Player.end_game()
	if snake_data[0] == rdonut1_pos:
		emit_signal("donut_was_eaten")
		move_rdonut1()
	if snake_data[0] == rdonut2_pos:
		emit_signal("donut_was_eaten")
		move_rdonut2()
	if snake_data[0] == rdonut3_pos:
		emit_signal("donut_was_eaten")
		move_rdonut3()
	if snake_data[0] == rdonut4_pos:
		emit_signal("donut_was_eaten")
		move_rdonut4()
	if snake_data[0] == rdonut5_pos:
		emit_signal("donut_was_eaten")
		move_rdonut5()
			
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
	return "user://record_score_lvl4.txt"


func _on_game_over_menu_main_menu():
	$Player.hide()
	$Background_music.stop()
	$GameOverMenu.hide()
	$Timer_chek_apple.stop()
	$Timer_move_donut1.stop()
	$Timer_move_donut2.stop()
	$Timer_move_donut3.stop()
	$Timer_move_donut4.stop()
	$Timer_move_donut5.stop()
	$Timer_new_donut.stop()
	emit_signal("main_menu")


func _on_main_menu_button_pressed():
	$Player.hide()
	$Background_music.stop()
	$GameOverMenu.hide()
	$Donut1.hide()
	$Donut2.hide()
	$Donut3.hide()
	$Donut4.hide()
	$Donut5.hide()
	$rDonut1.hide()
	$rDonut2.hide()
	$rDonut3.hide()
	$rDonut4.hide()
	$rDonut5.hide()
	emit_signal("main_menu")

func _on_timer_move_donut_1_timeout():
	move_donut1()
	move_rdonut1()

func _on_timer_move_donut_2_timeout():
	move_donut2()
	move_rdonut2()

func _on_timer_move_donut_3_timeout():
	move_donut3()
	move_rdonut3()

func _on_timer_move_donut_4_timeout():
	move_donut4()
	move_rdonut4()

func _on_timer_move_donut_5_timeout():
	move_donut5()
	move_rdonut5()

func _on_timer_new_donut_timeout():
	if timertim == 1:
		move_donut2()
		$Timer_move_donut2.start()
		timertim = 2
	elif timertim == 2:
		move_donut3()
		$Timer_move_donut3.start()
		timertim = 3
	elif timertim == 3:
		move_donut4()
		$Timer_move_donut4.start()
		timertim = 4
	elif timertim == 4:
		move_donut5()
		$Timer_move_donut5.start()
		timertim = 0

