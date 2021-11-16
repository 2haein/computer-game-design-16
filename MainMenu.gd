extends Node

func _ready():
	# Initalization here
	pass

func _on_NewGame_mouse_entered():
	get_node("/root/globall").goto_scene("res://Main.tscn")
	pass
	
func _on_Exit_mouse_entered():
	get_node("/root/globall").goto_scene("res://Main.tscn")
	pass
