extends CharacterBody2D

@export var speed = 300.0

@onready var player = get_node("/root/Game/Player")	# onready等同于放进ready函数中

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
