extends RichTextLabel
var score = 0


func _ready():
	AddScore(0)
	pass
	
func AddScore(val):
	score += val
	globall.score = score
	text = "Score : " + str(globall.score)
	pass


