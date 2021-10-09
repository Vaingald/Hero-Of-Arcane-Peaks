extends Node
class_name musicmanager

onready var gameobject = get_node("/root/MainGameobject")
export var audiopath = "res://Audio/Music/ost_sunrays.wav" #Default Audio, editable from godot inspector

func _ready():
	gameobject.musicplayer.stream = load(audiopath)
	gameobject.musicplayer.play()
