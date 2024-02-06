extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()	# 获取重叠
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()	# 获取第一个
		look_at(target_enemy.global_position)