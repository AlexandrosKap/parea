extends Control

const utils := preload("res://src/Utils.gd")

export(String, FILE, "*.fcsv") var path := ""

onready var parea := $Parea

func _ready():
	parea.show_dialogue(utils.read_csv(path))

func _input(event):
	if event.is_action_pressed("ui_accept"):
		parea.show_dialogue(utils.read_csv(path))
