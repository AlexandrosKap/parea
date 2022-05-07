extends Control

export(String, FILE, "*.fcsv") var path := ""

var parea := preload("./backend/Parea.gd").new()
onready var parea_ui := $PareaUI

func _ready():
	parea.load_language(path)
	parea_ui.show_dialogue(parea.get_lines("level1/hello"))

func _input(event):
	if event.is_action_pressed("ui_accept"):
		parea_ui.show_dialogue(parea.get_lines("level1/hello"))
