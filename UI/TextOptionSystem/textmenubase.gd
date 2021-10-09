extends Control

export(NodePath) var optionvboxpath

export(Array, Array, String) var options = ["New save", "Load save"]

onready var optionvbox = get_node(optionvboxpath)

onready var optionscene = preload("res://UI/TextOptionSystem/Option.tscn")

onready var arrowscene = preload("res://UI/TextOptionSystem/TextmenuArrow.tscn")

onready var arrow = arrowscene.instance()

onready var gameobject = get_node("/root/MainGameobject")

var selectedoption = 0

var arrow_position_change = 20

var arrow_x_offset = -32

onready var UISound = AudioStreamPlayer.new()

signal signal_option_selected(index)

func arrow_to_top():
	arrow.rect_position = optionvbox.rect_position + Vector2(arrow_x_offset, 0)


func _ready():
	
	add_child(UISound)
	add_child(arrow)
	arrow_to_top()
	UISound.stream = load("res://Audio/skr_uiping2.wav")
	
	for x in range(options.size()):

		var singleoption = optionscene.instance()
		optionvbox.add_child(singleoption)
		singleoption.text = str(options[x])
		
func get_input():
	if Input.is_action_just_pressed("ui_down"):
		selectedoption += 1
		arrow.rect_position += Vector2(0, arrow_position_change)
		UISound.play()
	
	if Input.is_action_just_pressed("ui_up"):
		selectedoption -= 1
		arrow.rect_position -= Vector2(0, arrow_position_change)
		UISound.play()
	
	if Input.is_action_just_pressed("shoot"):
		option_selected()
		UISound.play()
		
	if selectedoption >= options.size() or selectedoption < 0:
		selectedoption = 0
		arrow_to_top()
	
func _process(_delta):
	get_input()


func _on_Mainmenu_signal_option_selected(index):
	pass # Replace with function body.
	
func option_selected():
	emit_signal("signal_option_selected", selectedoption)
