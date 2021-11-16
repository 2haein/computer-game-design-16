extends Node

func _ready():
	# Initalization here
	set_process_input(true)
	pass

func _on_NewGame_mouse_entered():
	get_node("/root/globall").goto_scene("res://Main.tscn")
	pass
	
func _on_Exit_mouse_entered():
	get_node("/root/globall").quit()
	pass


func _on_NewGame_gui_input(event):
	if event is InputEventMouseButton:
		get_node("/root/globall").goto_scene("res://Main.tscn")
		pass # Replace with function body.


func _on_Tutorial_gui_input(event):
	if event is InputEventMouseButton:
		get_node("/root/globall").goto_scene("res://Tutorial.tscn")
		pass # Replace with function body.


func _on_Exit_gui_input(event):
	if event is InputEventMouseButton:
		get_tree().quit()
		pass # Replace with function body.
