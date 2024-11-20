extends CharacterBody2D

var bullet_load = load("res://Objects/Bullet.tscn")

const speed = 450
const jumpforce = -1.35

const knocked = Vector2(-420, -600)
var invincible = false
var allow_input = true
var allow_movement = true
var allow_anim = true

var startpos = position
var gravity = 5

@onready var AnimTree = $AnimationTree
@onready var AnimPlayer = $AnimationPlayer2
@onready var KnockbackTimer = $KnockbackTimer
@onready var IframesTimer = $IframesTimer
@onready var ShootingTimer = $ShootingTimer

func _ready():
	AnimTree.active = true

func _input(event):
	if event.is_action_pressed("Shoot"):
		Shoot()

func SetAnim(animnum):
	# 0 idle / .1 run / .2 Jump / .3 Hurt / .4 Die
	AnimTree.set("parameters/Animations/blend_position", animnum)



func KMS():
		allow_movement = false
		allow_input = false
		allow_anim = false
		SetAnim(.4)
		Manager.PlatformSpeedUp(1)
		$"../Countdown".stop()
		$"../PlatformSpeedUp".stop()
		$"../ParallaxPlayer".play("Stop")
		Manager.GameOver()

func Hurt(by_enemy = false):
	if by_enemy == true:
		if invincible == false:
			Manager.lives_left -= 1
			$Sounds/PlayerHurt.play()
			Manager.GameParent.DecreaseLives()
			Knockback()
		
	else:
		Manager.GameParent.DecreaseLives()
		Manager.lives_left -= 1
		$Sounds/PlayerHurt.play()
		if Manager.lives_left <= 0:
			KMS()
			return
		position = startpos
		velocity = Vector2.ZERO

func Knockback():
	velocity = knocked
	
	if KnockbackTimer.is_stopped():
		KnockbackTimer.start()
	
	if IframesTimer.is_stopped():
		IframesTimer.start()
	
	allow_input = false
	invincible = true
	
	AnimPlayer.play("SpriteBlink")

func KnockbackTimeout():
	if Manager.lives_left <= 0:
		KMS()
		return
	allow_input = true

func IframesTimeout():
	invincible = false
	AnimPlayer.play("RESET")



func Shoot():
	if ShootingTimer.is_stopped():
		ShootingTimer.start()
		$Sounds/PlayerShoot.play()
		var bullet = bullet_load.instantiate()
		Manager.GameParent.add_child(bullet)
		bullet.position = position



func _physics_process(delta):
	# PHYSICS
	if allow_input == true:
		
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = jumpforce * 1000
			$Sounds/PlayerJump.play()
		
		var direction = Input.get_axis("Left", "Right")
		velocity.x = direction * speed
	
	if allow_movement == true:
		if !is_on_floor():
			velocity.y += gravity * delta * 1000
		
		move_and_slide()
	
	# ANIMATION
	if allow_anim == true:
		if is_on_floor():
			if velocity.x == 0:
				SetAnim(0)
			else:
				SetAnim(.1)
		else:
			SetAnim(.2)
