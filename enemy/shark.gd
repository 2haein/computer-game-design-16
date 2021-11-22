extends KinematicBody

var SPEED = rand_range(10,30)

func _physics_process(delta):
	move_and_slide(Vector3(0,0,SPEED))
	if transform.origin.z > 10:
		queue_free()
