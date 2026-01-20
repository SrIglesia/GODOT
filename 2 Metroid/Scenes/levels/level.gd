extends Node2D

var bullet_scene = preload("res://Scenes/entities/bullet.tscn")


func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_scene.instantiate() as Area2D
	$Bullets.add_child(bullet)
	bullet.setup(pos, dir)
	bullet.scale = Vector2(0, 0)
	var tween = get_tree().create_tween()
	tween.tween_property(bullet, 'scale', Vector2(1, 1),0.5)
