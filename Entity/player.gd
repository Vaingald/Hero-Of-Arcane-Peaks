extends Node2D

#Script used by the parent node of left and right character.
onready var player_vars = get_node("/root/PlayerVariables") #PlayerVariables node is as a "persistent" autoload which uses playervariables.gd
onready var gameobject = get_node("/root/MainGameobject")
onready var sfxdamage = $sfx/sfxDamage
onready var sfxgraze = $sfx/sfxGraze
const bulletscript = preload("res://Entity/bullet1.gd")
var hp = 5

func _ready():
	
	if gameobject.hp_indicator != null:
		print(gameobject.hp_indicator)
	
	pass 

func _on_lArea_area_entered(area):
	if area.get_collision_layer_bit(2) == true:
		damage()

func damage():
	if hp > 0:
		hp -= 1
		sfxdamage.play()
		gameobject.hp_indicator.frame = hp
		get_tree().paused = true #Pausing game after damage for a brief period
		#Engine.time_scale /= 8
		$AfterdamageTimer.start()
		
	else: #game over
		gameover()

func gameover():
	get_tree().change_scene("res://UI/menu_gameover.tscn")



func _on_AfterdamageTimer_timeout():
	get_tree().paused = false
	#Engine.time_scale * 8

func _on_lGrazeArea_area_entered(area):
	sfxgraze.play()
	gameobject.grazescore += 1
