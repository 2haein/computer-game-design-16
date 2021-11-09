extends Node


onready var icons = [$Icon0, $Icon1 ,$Icon2]

func SetIcon(val):
	print(val)
	for i in range(len(icons)):
		icons[i].visible = false
	for i in range(val):
		icons[i].visible = true
