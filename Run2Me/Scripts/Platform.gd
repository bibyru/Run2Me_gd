extends CharacterBody2D

var platform_load = load("res://Objects/Platform.tscn")
var enemy_load = load("res://Objects/Enemy.tscn")

var speed = 0

func SpawnPlatform():
	var new_platform = platform_load.instantiate()
	Manager.PlatformParent.add_child(new_platform)
	
	if (randi() % 51) < 25:
		new_platform.position.y = 150
	new_platform.speed = speed
	
	var enemy
	if (randi() % 51) < 25:
		enemy = enemy_load.instantiate()
		Manager.GameParent.add_child(enemy)
		enemy.position = Manager.PlatformParent.position
		enemy.position.x -= 50
		enemy.position.y -= .5
	
	queue_free()

func _physics_process(delta):
	velocity.x = -speed * delta * 1000
	move_and_slide()
