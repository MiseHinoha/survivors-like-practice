extends CharacterBody2D

@export var speed = 300.0
@export var max_health = 5

@onready var player = get_node("/root/Game/Player")	# onready等同于放进ready函数中

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	max_health -= 1
	%Slime.play_hurt()
	
	# 判断角色血量
	if max_health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
