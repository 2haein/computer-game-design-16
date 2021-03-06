extends KinematicBody

const SPEED = 30
const accel = 0.75
const MaxPowerUp = 3
var inputVector = Vector3()
var velocity = Vector3()
var cooldown = 0
var KillParticles = load("res://KillParticles.tscn")

var COOLDOWN = 20 #공격 쿨탐
var powerUp = 0
var bomb = 3

onready var anim = $AnimationPlayer
onready var explodeSound = $EnemyExplode
onready var bombSound = $BombSound
onready var powerUpSound = $PowerUpSound
onready var gun = [$Gun]
onready var main = get_node("/root/globall").current_scene

# onready var main = get_tree().current_scene
var Bullet = load("res://bullet.tscn")
var FruitBomb = load("res://Player/FruitBomb.tscn")

func _ready():
	UpdatePowerUpUI()
	UpdateBombUI()
	PlayAnim()
	pass
	
func PlayAnim():
	anim.play("Idle")
	
func _physics_process(delta):
	GetInput()
	CalculateVelocity()
	Move()
	Shoot(delta)
	Bomb()
	pass
	
func GetInput():
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputVector = inputVector.normalized()
	
func CalculateVelocity():
	velocity.x = move_toward(velocity.x, inputVector.x * SPEED, accel)
	velocity.y = move_toward(velocity.y, inputVector.y * SPEED, accel)
	rotation_degrees.z = velocity.x * -2
	rotation_degrees.x = velocity.y / 2
	rotation_degrees.y = -velocity.x / 2
	pass
	
func Move():
	move_and_slide(velocity)
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	pass
	
func Shoot(delta):
	#shooting
	if Input.is_action_pressed("ui_select") and cooldown <= 0:
		cooldown = COOLDOWN * delta
		var bullet = Bullet.instance()
		main.add_child(bullet)
		bullet.transform = global_transform
		bullet.velocity = bullet.transform.basis.z * -600
	#cooldown
	if cooldown > 0:
		cooldown -= delta
	pass
	
func Bomb():
	if Input.is_action_just_pressed("ui_accept") and bomb > 0:
		bomb -=1;
		var fruit = FruitBomb.instance()
		main.add_child(fruit)
		fruit.transform = global_transform
		#fruit.scale = Vector3(25,25,25)
		fruit.velocity = fruit.transform.basis.z * - 90
		bombSound.play()
		UpdateBombUI()
	pass
	
# player collision
func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		explodeSound.play()
		main.get_node("PlayerSpawner").OnPlayerDead()
		body.queue_free()
		queue_free()
		
	elif body.is_in_group("PowerUp"):
		body.queue_free()
		if(powerUp < MaxPowerUp):
			powerUpSound.play()
			powerUp += 1
			COOLDOWN -= 3
			UpdatePowerUpUI()
	pass

func UpdatePowerUpUI():
	main.get_node("UI").get_node("PowerUpContainer").SetIcon(powerUp)
	pass
	
func UpdateBombUI():
	main.get_node("UI").get_node("BombContainer").SetIcon(bomb)
	pass
