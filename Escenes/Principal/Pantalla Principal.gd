extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	$Personatge.position = Vector2(25, 390)

func _process(delta):
	if $Personatge.vides < 5:
		$Vida5.visible = false
	if $Personatge.vides < 4:
		$Vida4.visible = false
	if $Personatge.vides < 3:
		$Vida3.visible = false
	if $Personatge.vides < 2:
		$Vida2.visible = false
	if $Personatge.vides < 1:
		get_tree().change_scene('res://Escenes/No_vides.tscn')
		

	

