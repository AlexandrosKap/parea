extends Control

const Parea := preload("../backend/Parea.gd")
const DPTextbox := preload("./components/DPTextbox.gd")

signal started
signal ended

var number := 0
var lines := []
var parea := Parea.new()
onready var textbox: DPTextbox = $DPTextbox

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if textbox.is_text_visible():
			number += 1
			if number >= len(lines):
				set_process_input(false)
				emit_signal("ended")
			else:
				show_text(lines[number])
		else:
			textbox.make_text_visible()

func start_playing(new_lines: Array) -> void:
	number = 0
	lines = new_lines
	show_text(lines[number])
	set_process_input(true)
	emit_signal("started")

func play_lines(set: String) -> void:
	start_playing(parea.get_lines(set))

func play_random_lines(sets: Array) -> void:
	start_playing(parea.get_random_lines(sets))

func play_line(code: String) -> void:
	start_playing([parea.get_line(code)])

func play_random_line(set: String) -> void:
	var new_lines := parea.get_lines(set)
	start_playing([new_lines[randi() % len(new_lines)]])

func move_textbox_top() -> void:
	textbox.move_top()

func move_textbox_mid() -> void:
	textbox.move_mid()

func move_textbox_bot() -> void:
	textbox.move_bot()

func load_language(path: String) -> void:
	parea.load_language(path)

func show_text(line: Array) -> void:
	textbox.show_name(parea.get_name(line))
	textbox.show_text(parea.get_text(line))

func is_playing() -> bool:
	return is_processing_input()
