extends Camera2D

export var yspeed = 2.0
export var xspeed = 0.0
onready var gameobject = get_node("/root/MainGameobject")

func _ready():
	
	gameobject.infolabel = $GameUI/Control/Label
	
	gameobject.hp_indicator = $GameUI/Control/indi_hp
	
	$GameUI/Control/savefileinfo.text = gameobject.savefile + ".vsave"
	$GameUI/Control/indi_difficulty.frame = gameobject.difficultyicon
	
func get_input():
	if Input.is_action_just_pressed("pause"):
		$GameUI/pausemenu.visible = true
		#get_tree().paused = true

func _process(delta):
	get_input()
	transform.origin.y -= yspeed * delta * 60
	transform.origin.x += xspeed * delta * 60
	$GameUI/Control/grazeinfo.text = "Graze: " + str(gameobject.grazescore)
	$GameUI/Control/bulletinfo.text = "bullets: " + str(gameobject.bullets_on_screen - 1)
