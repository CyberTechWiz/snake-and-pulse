#Lvl 1
# Собрать 20 яблок
extends Node

@export var apple_scene: PackedScene

signal start_new_game
signal food_was_eaten

var snake_data
var apples = []  # Глобальный массив для хранения ссылок на яблоки

# сетка
var cells : int = 24
var cell_size : int = 20

var score = 0
var food_pos : Vector2
var regen_apples = true

# Called when the node enters the scene tree for the first time.
func _ready():
	# Получаем ссылку на узел player
	var player = $Player
	#получаем данные о змейке из сцены игрока
	snake_data = player.get_snake_data()
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	score = 0
	$SpawnApplesTimer.start()
	$Timer.start()
	emit_signal("start_new_game")
	move_apples()

func move_apples():
	while regen_apples:
		regen_apples = false
		food_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		for i in snake_data:
			if food_pos == i:
				regen_apples = true
	$Apple.position = (food_pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	regen_apples = true

func _on_player_game_over():
	$SpawnApplesTimer.stop()


# Проверка на поедание еды (только яблоки)
func check_food_eaten():
	if snake_data[0] == food_pos:
		score += 1
		emit_signal("food_was_eaten")
		move_apples()
		


func _on_timer_timeout():
	check_food_eaten()
	print(score)
