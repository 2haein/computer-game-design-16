extends Spatial

onready var main =  get_node("/root/globall").current_scene
var Shark= load("res://enemy/shark.tscn")
var Whale = load("res://enemy/whale.tscn")
var Submarine = load("res://enemy/submarine.tscn")
var Jellyfish = load("res://enemy/jellyfish.tscn")
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
	submarine.transform.origin = transform.origin

func spawn_Jellyfish():
	var jellyfish = Jellyfish.instance()
	main.add_child(jellyfish)
	jellyfish.transform.origin = Vector3(rand_range(-15,15), rand_range(-10,10), -60)
	


func _on_Timer_timeout():
	if (count < 1):
		main.get_node("UI").get_node("Stage1").show()
		spawn_Shark()
	elif(count < 20):
		main.get_node("UI").get_node("Stage1").hide()
		main.get_node("UI").get_node("Stage2").show()
		spawn_Whale()
	else :
		main.get_node("UI").get_node("Stage2").hide()
		main.get_node("UI").get_node("Stage3").show()
		spawn_Submarine()
		$Timer.stop()
		$Timer2.start()
	count += 1

func _on_Timer2_timeout():
	spawn_Jellyfish()



