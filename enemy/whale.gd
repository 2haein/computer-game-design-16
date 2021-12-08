extends KinematicBody

var SPEED = rand_range(30,40)
export (int) var HP = 2

func _physics_process(delta):
	move_and_slide(Vector3(0,0,SPEED))
	if transform.origin.z > 10:
		queue_free()

func hit():
	if(HP <= 1) :
		queue_free()
		
	else :
		HP -= 1
