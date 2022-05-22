extends Control

const DialoguePlayer := preload("res://src/libs/parea/frontend/DialoguePlayer.gd")

var counter := 0
var sets := ["level1/bob", "level1/hello", "level2/redName", "level2/theory"]
onready var ui: DialoguePlayer = $DialoguePlayer

func _ready() -> void:
	ui.move_textbox_mid()
	ui.load_language("res://configs/dialogue/en.fcsv")
	ui.play(sets[counter])
	var err := ui.connect("ended", self, "_on_DialoguePlayer_ended")
	assert(err == 0)

func _on_DialoguePlayer_ended() -> void:
	counter += 1
	if counter >= len(sets):
		counter = 0
	ui.play(sets[counter])
