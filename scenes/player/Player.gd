extends Node2D

@export var player_had_scene: PackedScene
@export var player_body_segment_scene: PackedScene

signal food_was_eaten
signal game_over

var lvl
var food_pos : Vector2 = Vector2(10, 10)

# сетка
var cells : int = 24
var cell_size : int = 20

var tolerance = 1.0  # Допуск в пикселях для сравнения координат
var game_started : bool = false

# Переменные для змеи
var old_data : Array
var snake_data : Array
var snake : Array
# Переменные для движения змеи
var start_pos = Vector2(9, 9)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var move_direction : Vector2
var can_move : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	lvl = get_parent()  # Получаем ссылку на родительский узел
	if lvl != null:
		if lvl.has_method("get_food_pos"):
			food_pos = lvl.get_food_pos()
		else:
			print("Parent node does not have method 'get_food_pos'")
	else:
		print("Parent node is null")
		
func new_game():
	$StopDonut.stop()
	clear_snake()
	move_direction = up
	can_move = true
	generate_snake()

func generate_snake():
	old_data.clear()
	snake_data.clear()
	snake.clear()
	# Начинаем с головой и тремя сегментами
	add_head(start_pos + Vector2(0, 0))
	for i in range(2):
		add_segment(start_pos + Vector2(0, i+1))

func add_segment(pos):
	snake_data.append(pos)
	var snakeSegment = player_body_segment_scene.instantiate()
	snakeSegment.position = (pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	add_child(snakeSegment)
	snake.append(snakeSegment)
	
func add_head(pos):
	snake_data.append(pos)
	var snakeSegment = player_had_scene.instantiate()
	snakeSegment.position = (pos * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	add_child(snakeSegment)
	snake.append(snakeSegment)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_snake()
	
	
func move_snake():
	if can_move:
		
		if Input.is_action_just_pressed("move_down") and move_direction != up:
			move_direction = down
			can_move = false
			if not game_started:
				start_game()
		elif Input.is_action_just_pressed("move_up") and move_direction != down:
			move_direction = up
			can_move = false
			if not game_started:
				start_game()
		elif Input.is_action_just_pressed("move_left") and move_direction != right:
			move_direction = left
			can_move = false
			if not game_started:
				start_game()
		elif Input.is_action_just_pressed("move_right") and move_direction != left:
			move_direction = right
			can_move = false
			if not game_started:
				start_game()
		
		
func start_game():
	game_started = true
	$MoveTimer.start()
	
func stop_moving():
	can_move = false

func _on_move_timer_timeout():
	can_move = true
	old_data = [] + snake_data
	snake_data[0] += move_direction
	for i in range(len(snake_data)):
		if i > 0:
			snake_data[i] = old_data[i-1]
		snake[i].position = (snake_data[i] * cell_size) + Vector2(cell_size / 2, cell_size / 2)
	check_out_of_bounds()
	check_self_eaten()

#Если голова змейки находится за пределом сетки то конец игры
func check_out_of_bounds():
	if snake_data[0].x < 0 or snake_data[0].x > cells - 1 or snake_data[0].y < 0 or snake_data[0].y > cells - 1:
		end_game()
	
#Если координаты головы совпадают с координатами сегмента тела то конец игры
func check_self_eaten():
	for i in range(1, len(snake_data)):
		if snake_data[0] == snake_data[i]:
			end_game()

			
func end_game():
	$StopDonut.stop()
	$MoveTimer.stop()
	game_started = false
	emit_signal("game_over")
	stop_moving()

func get_snake_data():
	return snake_data


func _on_lvl_1_food_was_eaten():
	$Sound_biting.play()
	add_segment(old_data[-1])


#Очистка змейки для переигрывания уровня
func clear_snake():
	for segment in snake:
		segment.queue_free()  # Удаляет сегмент из сцены
	snake.clear()  # Очищает список сегментов
	snake_data.clear()  # Очищает данные о позиции змейки


func _on_stop_donut_timeout():
	can_move = true
	$MoveTimer.start()


func _on_lvl_2_donut_was_eaten():
	$MoveTimer.stop()
	can_move = false
	$StopDonut.start()


func _on_lvl_1_main_menu():
	$StopDonut.stop()
	game_started = false
	$MoveTimer.stop()
	can_move = false


