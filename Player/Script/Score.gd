extends RichTextLabel
var score = 0

func _ready():
	AddScore(0)
	pass
	
func AddScore(val):
	score += val
	text = "Score : " + str(score)
	pass

