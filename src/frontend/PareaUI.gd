extends Control

enum {NAME, NUMBER, SCENE, TEXT}

var parea := preload("../backend/Parea.gd").new()
var number := 0
var lines := []
export(String, FILE, "*.fcsv") var path := ""
onready var text_box := $PareaTextBox

func _ready() -> void:
	parea.load_language(path)
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if text_box.is_text_visible():
			number += 1
			if number >= len(lines):
				set_process_input(false)
			else:
				show_text(lines[number])
		else:
			text_box.make_text_visible()

func play(set: String) -> void:
	number = 0
	lines = parea.get_lines(set)
	show_text(lines[number])
	set_process_input(true)

func play_random(sets: Array) -> void:
	play(parea.get_random_set(sets))

func show_text(line: Array) -> void:
	text_box.show_text(
		parea.get_name(line)
		+ ":  " 
		+ parea.get_text(line)
	)
