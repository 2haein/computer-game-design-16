extends KinematicBody

var SPEED = 50
var HP = 20


func _physics_process(delta):
	move_and_slide(Vector3(0,0,SPEED))
	if transform.origin.z > 10:
		queue_free()

func hit():
	if(HP <= 0) :
		queue_free()
	else :
		HP -= 1
