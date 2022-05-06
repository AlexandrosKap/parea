extends Control

export(String, FILE, "*.fcsv") var path := ""

var parea := preload("./backend/Parea.gd").new()
onready var parea_ui := $PareaUI

var my_line_set = ["GRN0LEV1", "GRN1LEV1", "GRN2LEV1"]

func _ready():
	parea.load_dialogue_lines(path)
	parea_ui.show_dialogue(parea.get_lines(my_line_set))

func _input(event):
	if event.is_action_pressed("ui_accept"):
		parea_ui.show_dialogue(parea.get_lines(my_line_set))
