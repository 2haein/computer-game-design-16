extends Node


onready var hearts = [$Heart0, $Heart1 ,$Heart2]

func SetHp(val):
	print(val)
	for i in range(len(hearts)):
		hearts[i].visible = false
	for i in range(val):
		hearts[i].visible = true
