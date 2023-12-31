extends Node2D

@onready var player = $Player
func nametag(): return 

var head = 0
var torso = 0
var pant = 0

func _ready():
	random()
	if !GameState.release:
		pass

func torso_right():
	change_torso(1)
func torso_left():
	change_torso(-1)
func change_torso(dir):
	torso = wrapi(torso+dir, 0, GameState.torsos)
	GameState.customize(player, head, torso, pant)
	$ClickSound.play()

func head_right():
	change_head(1)
func head_left():
	change_head(-1)
func change_head(dir):
	head = wrapi(head+dir, 0, GameState.heads+GameState.hairs-1)
	GameState.customize(player, head, torso, pant)
	$ClickSound.play()


func pants_left():
	change_pants(-1)
func pants_right():
	change_pants(1)
func change_pants(dir):
	pant = wrapi(pant+dir, 0, GameState.pants)
	GameState.customize(player, head, torso, pant)
	$ClickSound.play()

	
func random():
	change_head(GameState.rng.randi_range(0, GameState.heads+GameState.hairs-1))
	change_torso(GameState.rng.randi_range(0, GameState.torsos))
	change_pants(GameState.rng.randi_range(0, GameState.pants))

func start():
	$StartSound.play()
	GameState.player_data = [head, torso, pant]
	GameState.transition(GameState.level_path)