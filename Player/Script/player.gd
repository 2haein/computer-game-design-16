extends KinematicBody

const SPEED = 30
const accel = 0.75
var inputVector = Vector3()
var velocity = Vector3()
var cooldown = 0
var KillParticles = load("res://KillParticles.tscn")

var COOLDOWN = 25 #공격 쿨탐

onready var explodeSound = $EnemyExplode
onready var guns = [$Gun0, $Gun1]
onready var main = get_node("/root/globall").current_scene

# onready var main = get_tree().current_scene
var Power = load("res://Player/Bullet.tscn")

func _ready():
	print("player ready called")
	pass
	
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
		for i in guns:
			var power = Power.instance()
			main.add_child(power)
			power.transform = i.global_transform
			power.velocity = power.transform.basis.z * -600
	#cooldown
	if cooldown > 0:
		cooldown -= delta
	pass
	
func Bomb():
	if Input.is_action_just_pressed("ui_accept"):
		print("Throw Bomb!")
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
		if(COOLDOWN>5):
			COOLDOWN -= 5
		#play power up sound, effect 
	pass
