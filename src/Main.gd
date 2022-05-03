extends Control

const UTILS := preload("res://src/Utils.gd")

export(String, FILE, "*.json") var path := ""

onready var parea := $Parea

func _ready():
	var dialogues: Dictionary = UTILS.read_json(path)
	parea.show_dialogue(dialogues["En"][0])

func _input(event):
	if event.is_action_pressed("ui_accept"):
		var dialogues: Dictionary = UTILS.read_json(path)
		parea.show_dialogue(dialogues["En"][0])
