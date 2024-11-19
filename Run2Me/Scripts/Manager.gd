extends Node2D

var records = []

var time = 0
var score = 0
var score_kill = 10
var score_second = 1

var GameParent = null
var lives_left = 5

var PlatformParent = null
var platform_speed_ini = 10
var platform_speed = 0
var platform_interval = 3

func _ready():
	get_window().content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS

func PlatformSpeedUp(platform_movement = 0):
	if platform_movement == 1:
		platform_speed = 0
		PlatformParent.SetSpeed()
		return
	
	if platform_movement == 2:
		platform_speed = platform_speed_ini
		PlatformParent.SetSpeed()
		return
	
	platform_speed += platform_interval
	PlatformParent.SetSpeed()

func GameOver():
	if $Timer.is_stopped:
		$Timer.start()
		records.append([score, time, Time.get_datetime_dict_from_system()])
		score = 0
		time = 0
		lives_left = 5

func ReloadGame():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("Esc"):
		get_tree().paused = !get_tree().paused
