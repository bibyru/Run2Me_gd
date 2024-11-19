extends CharacterBody2D

var speed = 80

func _on_area_2d_body_entered(body):
	body.Hurt(true)
	queue_free()

func _physics_process(delta):
	velocity.x = speed * delta * 1000
	move_and_slide()
