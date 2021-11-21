extends Spatial

onready var main =  get_node("/root/globall").current_scene
var PowerUp = load("res://Player/PowerUp.tscn")

func spawn():
	var pu = PowerUp.instance()
	main.add_child(pu)
	pu.transform.origin = transform.origin + Vector3(rand_range(-12.5,12.5), rand_range(-8.5,8.5), 0)
	print("power up")

func _on_Timer_timeout():
	spawn()
