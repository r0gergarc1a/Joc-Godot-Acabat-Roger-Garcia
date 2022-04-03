extends KinematicBody2D

var velocitat_base = 200 
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -500
var vides = 7

func _ready():
	position = Vector2(25, 390)

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("salta") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)

func animation(velocitat):
	if velocitat.x > 0 and velocitat.y > -2:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0 and velocitat.y > -2:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = true
	if abs(velocitat.x) < 0.1 and velocitat.y > -1:
		$AnimatedSprite.play("default")
	if velocitat.y < 0:
		$AnimatedSprite.play("Salt1")
	if velocitat.y > 0:
		$AnimatedSprite.play("Salt2")
		
		

func _on_Respawn_body_entered(body):
	position = Vector2(25, 390)
	vides -= 1

func _on_Trampoli_body_entered(body):
	if body.get_name() == 'Personatge':
		velocitat.y = -800

func _on_Area2D_body_entered(body):
	$Trampoline.play('salt')

func _on_Bandera_body_entered(body):
	if body.get_name() == 'Personatge':
		get_tree().change_scene('res://Escenes/Final/Pantalla Final.tscn')

func _on_Teletransport_body_entered(body):
	if body.get_name() == 'Personatge':
		get_tree().change_scene('res://Escenes/Principal/Pantalla Principal.tscn')
