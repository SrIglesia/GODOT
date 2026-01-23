extends Node2D

var bullet_scene = preload("res://Scenes/entities/bullet.tscn")


func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	$Bullets.add_child(bullet)
	bullet.setup(pos, dir)
	bullet.scale = Vector2(0, 0)
	var tween = get_tree().create_tween()
	tween.tween_property(bullet, 'scale', Vector2(1, 1),0.5)

func _ready() -> void:
	var light_tween = get_tree().create_tween()
	light_tween.set_loops()
	light_tween.tween_property($PointLight2D, "energy",1.6, 0.05)
	light_tween.tween_property($PointLight2D, "energy",0.4, 0.05)
