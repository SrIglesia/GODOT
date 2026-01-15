extends Control

func _ready() -> void:
	var score = Global.score
	$Label2.text = 'High score = ' + str(score)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Space"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")	
