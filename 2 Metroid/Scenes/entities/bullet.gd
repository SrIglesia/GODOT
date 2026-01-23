extends Area2D

var direction: Vector2
var speed := 150

# Called when the node enters the scene tree for the first time.
func setup(pos: Vector2, dir: Vector2):
	position = pos + dir * 16
	direction = dir

func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.has_method('hit'):
		body.hit()
	queue_free()
