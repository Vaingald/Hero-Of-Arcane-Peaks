extends Node2D

var scn_bullet = preload("res://Entity/bullet1.tscn")

var bullet = scn_bullet.instance()

var scn_player = preload("res://Entity/player.tscn")

var difficulty = 1

var difficultyicon = 1

var player = scn_player.instance()

onready var infolabel = null #assinged in func _ready

onready var hp_indicator = null #assinged in func _ready

onready var musicplayer = $MusicPlayer

var savefile = str(OS.get_unix_time()) #Fallback filename

onready var pausemenu = $pausemenu

var grazescore = 0

#Organizing level order

const _order = [
	#Level 0
	"gameover",
	# World 1
	"chapter1/c1_lvl1"
	# World 2
]


static func get_level(var index: int):
	return str("res://levels/", _order[index], ".tscn")


func _ready():

	
	
	# Add player to the scene
	#self.add_child(player)
	# Set player position
	#player.position = Vector2(0, 0)
	pass


func _process(delta):
	if infolabel: #validating if infolabel exists otherwise changing levels causes null instance errors.
		#infolabel.set_text("savefile:" + savefile + ".vsave");
		pass
		
func savegame():
	var save_game = File.new()
	
	var save_dict = {
		"level" : get_tree()
	}
	
	save_game.open("users://" + savefile + ".vsave")
	
func get_input():
	if Input.is_action_just_pressed("pause"):
		pausemenu.visible = true
