extends KinematicBody

var velocity = Vector3()
var KillParticles = load("res://KillParticles.tscn")
onready var main =  get_node("/root/globall").current_scene
onready var explodeSound = $EnemyExplode
const bulletHitScore = 10

func _physics_process(delta):
	move_and_slide(velocity)
	if transform.origin.z < -300:
		queue_free()

func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.hit()
		GetScore(bulletHitScore)
		explodeSound.play()
		visible = false
		$Area/CollisionShape.disabled = true

func _on_LightTimer_timeout():
	$OmniLight.visible = false

func GetScore(val):
	main.get_node("UI").get_node("Score").AddScore(val)
