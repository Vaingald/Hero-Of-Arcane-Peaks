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

var grazescore = 20

var enemy_bullets = null

var bullets_on_screen = 0

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
	update_enemy_bullets(delta)
func savegame():
	var save_game = File.new()
	
	var save_dict = {
		"level" : get_tree().get_root().get_children()
	}
	
	save_game.open("users://" + savefile + ".vsave", File.READ)
	save_game.store_string(to_json(var2str(save_dict)))
	save_game.close()
		
func loadgame():
	
	var load_game = File.new()
	
	load_game.open()
	
	#var parseresult = JSON.parse(save_game)

func get_input():
	if Input.is_action_just_pressed("pause"):
		pausemenu.visible = true

func update_enemy_bullets(delta):
	if get_tree().get_nodes_in_group("enemy_bullet"):
		var enemy_bullets = get_tree().get_nodes_in_group("enemy_bullet")
		for i in range (0, enemy_bullets.size()):
			enemy_bullets[i].rotation = enemy_bullets[i].velocity.angle() + 90
			enemy_bullets[i].move_and_slide(enemy_bullets[i].velocity * 50, Vector2(0, 1) * delta)
		bullets_on_screen = enemy_bullets.size()
