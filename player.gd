extends KinematicBody

const SPEED = 30
const accel = 0.75
var inputVector = Vector3()
var velocity = Vector3()
var cooldown = 0
const COOLDOWN = 8

onready var guns = [$Gun0, $Gun1]
onready var main = get_node("/root/globall").current_scene
# onready var main = get_tree().current_scene
var Power = load("res://Bullet.tscn")

func _physics_process(delta):
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputVector = inputVector.normalized()
	velocity.x = move_toward(velocity.x, inputVector.x * SPEED, accel)
	velocity.y = move_toward(velocity.y, inputVector.y * SPEED, accel)
	rotation_degrees.z = velocity.x * -2
	rotation_degrees.x = velocity.y / 2
	rotation_degrees.y = -velocity.x / 2
	move_and_slide(velocity)
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	
	#shooting
	if Input.is_action_pressed("ui_accept") and cooldown <= 0:
		cooldown = COOLDOWN * delta
		for i in guns:
			var power = Power.instance()
			main.add_child(power)
			power.transform = i.global_transform
			power.velocity = power.transform.basis.z * -600
			
	#cooldown
	if cooldown > 0:
		cooldown -= delta
