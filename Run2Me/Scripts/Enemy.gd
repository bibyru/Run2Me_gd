extends CharacterBody2D

const gravity = 3

func Hurt(by_bullet: bool = false):
	$AnimationPlayer.play("Hurt")
	if by_bullet == true:
		$Sounds/EnemyHurt.play()
		Manager.score += Manager.score_kill
		Manager.GameParent.UpdateUI()
		$Area2D.monitoring = false

func KMS():
	queue_free()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta * 1000
	move_and_slide()

func PlayerEnteredArea(body):
	body.Hurt(true)
