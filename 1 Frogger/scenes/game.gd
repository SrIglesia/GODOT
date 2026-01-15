extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var score = 0


func _on_finish_body_entered(_body: Node2D) -> void:
	if score < Global.score:
		Global.score = score
	call_deferred('change_scene')

func change_scene():
	get_tree().change_scene_to_file("res://scenes/Title.tscn")


func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate()
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect('body_entered',go_to_title)
	
func go_to_title(_body):
	call_deferred('change_scene')	


func _on_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = 'Score: ' + str(score) 
