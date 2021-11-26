extends Spatial

onready var main =  get_node("/root/globall").current_scene
var Player = load("res://Player/player.tscn")
var life = 3


func _ready():
	call_deferred("Spawn")
	call_deferred("SetHp",life)
	pass
	
func Spawn():
	var player = Player.instance()
	call_deferred("add_child",player)
	player.transform.origin = transform.origin
	pass

func OnPlayerDead():
	SetHp(life-1)
	# check life
	if(life<=0):
		GameOver()
	else:
		Spawn()
	pass

func SetHp(val):
	life = val
	main.get_node("UI").get_node("HeartsContainer").SetIcon(life)
	
func GameOver():
	get_node("/root/globall").goto_scene("res://GameOver.tscn")
	pass


func _on_Exit_gui_input(event):
	if event is InputEventMouseButton:
		get_node("/root/globall").goto_scene("res://MainMenu.tscn")
		pass # Replace with function body.
		
