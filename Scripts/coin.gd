extends Area2D

func _on_coin_body_entered(body):
	if body.is_in_group("player"):
		hide()
		Events.emit_signal("player_hit_coin")

func active_coin():
	visible=true
	monitoring=true
	
func hide():
	visible=false
	set_deferred("monitoring", false)
