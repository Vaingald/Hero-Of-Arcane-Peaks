extends Camera2D

export var yspeed = 2
export var xspeed = 0
onready var gameobject = get_node("/root/MainGameobject")

func _ready():
	
	gameobject.infolabel = $GameUI/Control/Label
	
	gameobject.hp_indicator = $GameUI/Control/indi_hp
	
	$GameUI/Control/savefileinfo.text = gameobject.savefile + ".vsave"
	$GameUI/Control/indi_hp.frame = gameobject.difficultyicon
func _process(delta):
	transform.origin.y -= yspeed
	transform.origin.x += xspeed
	$GameUI/Control/grazeinfo.text = "Graze: " + str(gameobject.grazescore)
	
