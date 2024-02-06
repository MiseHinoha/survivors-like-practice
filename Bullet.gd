extends Area2D

@export var speed = 1000	# 子弹速度
@export var travelled_distance = 0

const RANGE = 1200	# 射程

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()	# 碰撞后销毁
	if body.has_method("take_damage"):
		body.take_damage()
	
