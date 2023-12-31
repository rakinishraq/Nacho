extends Node2D

var collected = false

@onready var editor = get_parent().get_name() != "LevelHost"

func _ready():
	print(get_parent().get_name())

func animate():
	$AnimationPlayer.play("idle")

func _on_area_2d_body_entered(body):
	if editor: return

	$AudioStreamPlayer2D.play()
	$Area2D.queue_free()
	collected = true

func _physics_process(delta):
	if !collected:
		return
	$Sprite2D.translate(Vector2.UP*5)
	$Sprite2D.modulate.a -= delta * 8


func _on_audio_stream_player_2d_finished():
	queue_free()
