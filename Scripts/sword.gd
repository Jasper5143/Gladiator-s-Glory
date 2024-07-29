extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scale.x == 1 :
		rotation += 0.1
	elif scale.x == -1:
		rotation += 0.1
	else:
		rotation -= 0.1


func _on_timer_timeout():
	queue_free()






func _on_body_entered(body):
	if body.name == "TileMap":
		queue_free()
