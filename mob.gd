extends CharacterBody2D

@export var speed = 300.0
@export var health = 3

@onready var player = get_node("/root/Game/Player")	# onready等同于放进ready函数中

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health -= 1
	
	# 判断角色血量
	if health == 0:
		queue_free()
