extends Spatial

onready var main =  get_node("/root/globall").current_scene
var Shark= load("res://enemy/shark.tscn")
var Whale = load("res://enemy/whale.tscn")
var Submarine = load("res://enemy/submarine.tscn")
var count = 1

func spawn_Shark():
	var shark = Shark.instance()
	main.add_child(shark)
	shark.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)

func spawn_Whale():
	var whale = Whale.instance()
	main.add_child(whale)
	whale.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)
	
func spawn_Submarine():
	var submarine = Submarine.instance()
	main.add_child(submarine)
	submarine.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)
	
	
func _on_Timer_timeout():
	if count < 10 :
		spawn_Shark()
	elif count < 20 :
		spawn_Whale()
	else :
		spawn_Submarine() 
		
	count = count + 1
