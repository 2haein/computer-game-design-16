extends Node


onready var icons = [$Icon0, $Icon1 ,$Icon2]

func SetIcon(val):
	if(val > len(icons)):
		return
	for i in range(len(icons)):
		icons[i].visible = false
	for i in range(val):
		icons[i].visible = true
