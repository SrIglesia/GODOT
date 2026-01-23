extends Node2D

var active: bool = false
var player: CharacterBody2D
var speed = 50
var health := 3



func _on_area_2d_body_entered(player_body: Node2D) -> void:
	player = player_body


func _on_area_2d_explosion_body_entered(_body: Node2D) -> void:
	explode()
		

func _physics_process(delta: float) -> void:
	if player:
		var dir = (player.position - position).normalized()
		position+=dir*delta*speed

		
func hit():
	health -= 1
	if health <=0:
		explode()
		$Explosion_audio.play()
	var hit_tween = create_tween()
	hit_tween.tween_property($Sprite2D.material, "shader_parameter/Progress", 0.0, 0.3)

func explode():
	$Sprite2D.visible = false
	$Sprite2_Explosion.visible = true
	$AnimationPlayer.play('explosion')
	speed = 0
	await $AnimationPlayer.animation_finished
	queue_free()
	
func chain_reaction():
	for drone in get_tree().get_nodes_in_group('Drones'):
		if position.distance_to(drone.position) < 40:
			drone.explode()
