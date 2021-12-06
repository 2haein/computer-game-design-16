extends KinematicBody

var SPEED = 100
export (int) var HP = 1000


func _physics_process(delta):
	if transform.origin.z < -80:
		move_and_slide(Vector3(0,0,SPEED))
	elif transform.origin.z > -80:
		move_and_slide(Vector3(0,0,0))
		
	
func hit():
	if(HP <= 0) :
		queue_free()
		get_node("/root/globall").goto_scene("res://GameOver.tscn")
	else :
		HP -= 1
