extends KinematicBody

var SPEED = rand_range(20,40)

func _physics_process(delta):
	move_and_slide(Vector3(0,0,SPEED))
	if transform.origin.z > 10:
		queue_free()
