extends Node2D

@onready var GameUI = $GameUI

func _ready():
	get_tree().paused = true
	GameUI.visible = false
	Manager.GameParent = self

func Start():
	get_tree().paused = false
	GameUI.visible = true
	Manager.PlatformSpeedUp(2)

func CountTime():
	Manager.score += Manager.score_second
	Manager.time += 1
	UpdateUI()

func DecreaseLives():
	$GameUI/Control/Lives.Decrease()
	UpdateUI()

func UpdateUI():
	$GameUI/Control/Score.text = "%05d" % Manager.score
	$GameUI/Control/Timer.text = "%02d:%02d" % [Manager.time/60, Manager.time%60]
