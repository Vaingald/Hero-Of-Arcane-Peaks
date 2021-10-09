extends KinematicBody2D

var scn_bullet = preload("res://Entity/bullet1.tscn")
var bulletcount = 0 #Useful for bullet patterns in the same way that time is useful for shaders.
var patternmodulus = 5
var interval = 0.1
var bulletspershot = 1
var counterresetlimit = 500
onready var enemysprite = $Sprite
onready var spriteselectdialog = get_node("../Control/FileDialog")
onready var entersound = $editsound #sonud to play when changes have been entered
onready var velocityexpression = Expression.new()
onready var expressioneditor = get_node("../Control/TextEdit")
var velocityresult = null
func _ready():
	pass




func _on_Timer_timeout():
	
	position += Vector2(0, 0)
	pattern1()

func pattern1():
	for i in bulletspershot:
		bulletcount += 1
		var bullet = scn_bullet.instance()
		get_node("../").add_child(bullet)
		bullet.set_position(Vector2(get_position()))
		if bulletcount %patternmodulus == 1: #check if bullet count is divisible by pattern modulus
			bullet.velocity = Vector2(sin(bulletcount / 4) * 2, cos(bulletcount / 4) * 2)
		else:
			bullet.velocity = Vector2(cos(bulletcount / 4) * 2, sin(bulletcount / 4) * 2)
		if bulletcount >= counterresetlimit: #Reset bullet counter
			bulletcount = 0


func _on_LineEdit_text_entered(new_text): #Modulus input in edtitor
	if int(new_text) != 0: #Make sure there's no division by zero
		patternmodulus = int(new_text)
	entersound.play()


func _on_LineEdit2_text_entered(new_text): #Fire interval input in edtitor
	interval = int(new_text)
	entersound.play()
	$Timer.wait_time = interval
	
	$Timer.stop()
	$Timer.start() #Restart timer every time so it doesn't get stuck if user enters something crazy


func _on_LineEdit3_text_entered(new_text): #Bullets per shot input in edtitor
	bulletspershot = int(new_text)
	entersound.play()


func _on_Button_pressed(): #Custom sprite selection
	spriteselectdialog.popup()


func _on_FileDialog_file_selected(path):
	var texture = load("res://Sprites/skr_placeholder.png")
	#var f = File.new
	#f.Open(path, 1)
	var image = Image.new()
	var err = image.load(path)
	texture = ImageTexture.new()
	enemysprite.set_texture(texture.create_from_image(image, 0))


func _on_LineEdit4_text_entered(new_text): #Bullet counter editor input
	counterresetlimit = int(new_text)
	entersound.play()


func _on_TextEdit_text_changed(command): #Velocity expression editor
	pass


func _on_Button2_pressed(): #Apply velocity expression
	var error = velocityexpression.parse(expressioneditor.get_text(), [])
	if error != OK:
		print(velocityexpression.get_error_text())
		return
	var result = velocityexpression.execute([], null, true)
	if not velocityexpression.has_execute_failed():
		get_node("../Control/VBoxContainer/Label7").set_text(result)
		velocityresult = result
		print(result)
