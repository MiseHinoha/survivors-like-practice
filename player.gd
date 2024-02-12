extends CharacterBody2D

signal healt_depleted

@export var speed = 600.0	# 移动速度
var health = 100.0	# 初始生命值
const DAMAGE_RATE = 50.0	# 伤害，这里正常来说该置成怪物的击力而不是玩家每一秒收到的伤害

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()	# 播放行走动画
	else:
		%HappyBoo.play_idle_animation()	# 待机状态
		
	var overlapping_mos = %HurtBox.get_overlapping_bodies()
	if overlapping_mos.size() > 0:
		health -= DAMAGE_RATE * overlapping_mos.size() * delta
		%HP_ProgressBar.value = health
		if health <= 0.0:
			healt_depleted.emit()
	
