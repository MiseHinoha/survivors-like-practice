extends CharacterBody2D

@export var speed = 600	# 移动速度

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()	# 播放行走动画
	else:
		get_node("HappyBoo").play_idle_animation()	# 待机状态
	
	move_and_slide()
