extends Control

const Parea := preload("../backend/Parea.gd")
const PareaTextbox := preload("./components/PareaTextbox.gd")

var parea := Parea.new()
var number := 0
var lines := []
onready var textbox: PareaTextbox = $PareaTextbox

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if textbox.is_text_visible():
			number += 1
			if number >= len(lines):
				set_process_input(false)
			else:
				show_text(lines[number])
		else:
			textbox.make_text_visible()

func play(set: String) -> void:
	number = 0
	lines = parea.get_lines(set)
	show_text(lines[number])
	set_process_input(true)

func play_random(sets: Array) -> void:
	play(parea.get_random_set(sets))

func move_textbox_top() -> void:
	textbox.move_top()

func move_textbox_mid() -> void:
	textbox.move_mid()

func move_textbox_bot() -> void:
	textbox.move_bot()

func load_language(path: String) -> void:
	parea.load_language(path)

func show_text(line: Array) -> void:
	textbox.show_text(
		parea.get_name(line)
		+ ":  " 
		+ parea.get_text(line)
	)
