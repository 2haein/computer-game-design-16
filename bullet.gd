extends KinematicBody

var velocity = Vector3()
var KillParticles = load("res://KillParticles.tscn")
onready var main =  get_node("/root/globall").current_scene
onready var explodeSound = $EnemyExplode
 
func _physics_process(delta):
	move_and_slide(velocity)

func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.queue_free()
		explodeSound.play()
		visible = false
		$Area/CollisionShape.disabled = true

func _on_LightTimer_timeout():
	$OmniLight.visible = false
