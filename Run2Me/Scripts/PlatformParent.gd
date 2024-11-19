extends Node2D

func _ready():
	Manager.PlatformParent = self

func SetSpeed():
	for child in get_children():
		child.speed = Manager.platform_speed

func GoFaster():
	Manager.PlatformSpeedUp()
