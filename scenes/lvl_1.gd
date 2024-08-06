#Lvl 1
# Собрать 20 яблок
extends Node

@export var apple_scene: PackedScene

signal start_new_game

var snake_data

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
	emit_signal("start_new_game")
	move_apples()

func move_apples():
	print("Move apples function called")
	while regen_apples:
		regen_apples = false
		food_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		
		# Проверяем, что позиция не пересекается со змеей
		for i in snake_data:
			if food_pos == i:
				regen_apples = true
				break
		
		if not regen_apples:
			# Создаем новый экземпляр яблока
			var apple = apple_scene.instantiate()
			apple.position = (food_pos * cell_size) + Vector2(0, cell_size)
			add_child(apple)
			apple.add_to_group("Apples")  # Добавляем яблоко в группу "Apples"
			print("Apple created at position: ", apple.position)

func _on_player_game_over():
	$SpawnApplesTimer.stop()


func _on_spawn_apples_timer_timeout():
	regen_apples = true
	print("Spawn apples timer timeout")
	move_apples()
