extends Node

@export var player_had_scene: PackedScene
@export var player_body_segment_scene: PackedScene

signal food_was_eaten
signal game_over

# сетка
var cells : int = 24
var cell_size : int = 20

var game_started : bool = false
var food_pos : Vector2

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
	pass
		
func new_game():
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
	snakeSegment.position = (pos * cell_size) + Vector2(0, cell_size)
	add_child(snakeSegment)
	snake.append(snakeSegment)
	
func add_head(pos):
	snake_data.append(pos)
	var snakeSegment = player_had_scene.instantiate()
	snakeSegment.position = (pos * cell_size) + Vector2(0, cell_size)
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
		snake[i].position = (snake_data[i] * cell_size) + Vector2(0, cell_size)
	check_out_of_bounds()
	check_self_eaten()
	check_food_eaten()

#Если голова змейки находится за пределом сетки то конец игры
func check_out_of_bounds():
	if snake_data[0].x < 0 or snake_data[0].x > cells - 1 or snake_data[0].y < 0 or snake_data[0].y > cells - 1:
		end_game()
	
#Если координаты головы совпадают с координатами сегмента тела то конец игры
func check_self_eaten():
	for i in range(1, len(snake_data)):
		if snake_data[0] == snake_data[i]:
			end_game()

# Проверка на поедание еды (только яблоки)
func check_food_eaten():
	for child in get_tree().get_nodes_in_group("Apples"):
		if child is Node2D:
			if child.has_method("get") and child.get("food_type") != null:
				var child_pos = child.position
				if snake_data[0] == child_pos / cell_size:
					add_segment(old_data[-1])
					emit_signal("food_was_eaten", child.get("food_type"))
					child.queue_free()
			else:
				print("Warning: Node in group 'Apples' does not have required properties.")
			
			
func end_game():
	$MoveTimer.stop()
	game_started = false
	emit_signal("game_over")

func get_snake_data():
	return snake_data
