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
				show_line(lines[number])
		else:
			textbox.make_text_visible()

func _process(delta: float) -> void:
	pass # Adding watch code later for animation style dialogue.

func start(new_lines: Array) -> void:
	number = 0
	lines = new_lines
	show_line(lines[number])
	set_process_input(true)
	emit_signal("started")

func play(set: String) -> void:
	start(parea.get_lines(set))

func watch(set: String) -> void:
	start(parea.get_lines(set))

func play_random(sets: Array) -> void:
	start(parea.get_random_lines(sets))

func watch_random(sets: Array) -> void:
	start(parea.get_random_lines(sets))

func move_textbox_top() -> void:
	textbox.move_top()

func move_textbox_mid() -> void:
	textbox.move_mid()

func move_textbox_bot() -> void:
	textbox.move_bot()

func load_language(path: String) -> void:
	parea.load_language(path)

func show_line(line: Array) -> void:
	textbox.show_name(parea.get_name(line))
	textbox.show_text(parea.get_text(line))

func is_playing() -> bool:
	return is_processing_input()
