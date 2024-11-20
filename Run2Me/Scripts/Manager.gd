extends Node2D

var records = []
var audiovol = [10,25,25]
# audiovol: 0 Master / 1 Sound / 2 Music
const savepath = "user://savedata.ini"

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

var bgm_position

func _ready():
	get_window().content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	LoadData()

func LoadData():
	var config = ConfigFile.new()
	config.load(savepath)
	
	records = config.get_value("Game", "Records", records)
	audiovol = config.get_value("Settings", "Audio", audiovol)

func SaveData():
	var config = ConfigFile.new()
	config.set_value("Game", "Records", records)
	config.set_value("Settings", "Audio", audiovol)
	config.save(savepath)

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
		$GameOver.play()
		records.append([score, time, Time.get_datetime_dict_from_system()])
		SaveData()
		score = 0
		time = 0
		lives_left = 5

func ReloadGame():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("Esc"):
		# cant unpause when game hasnt started
		if GameParent.game_started == false:
			return
		
		get_tree().paused = !get_tree().paused
		
		# pausing audio when paused
		if get_tree().paused == true:
			bgm_position = $BGM.get_playback_position()
			$BGM.stop()
		else:
			if bgm_position == null:
				$BGM.play()
			else:
				$BGM.play(bgm_position)
