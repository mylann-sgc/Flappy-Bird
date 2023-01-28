extends Area2D

func set_visible(s):
	visible = s
	monitoring = s

func _on_obstacle_body_entered(body: PhysicsBody2D):
	if body.is_in_group("player"):
		Events.emit_signal("player_hit_obstacles")
