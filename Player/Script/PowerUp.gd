extends KinematicBody

var SPEED = 30
var ROTATE = 3

func _physics_process(delta):
	move_and_slide(Vector3(0,0,SPEED))
	rotate_x(ROTATE*delta)
	
	if transform.origin.z > 10:
		queue_free()
