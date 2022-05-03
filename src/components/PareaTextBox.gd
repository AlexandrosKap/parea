extends VBoxContainer

var text_speed := 16.0

onready var label: RichTextLabel = $Panel/Margin/Label

# Hide default text.
func _ready() -> void:
	show_text("")

# Update label.percent_visible until its value is 1.
func _process(delta: float) -> void:
	var char_count := label.get_total_character_count()
	if char_count:
		label.percent_visible += (1.0 / char_count) * text_speed * delta
		if label.percent_visible > 1.0:
			label.percent_visible = 1.0
	else:
		label.percent_visible = 1.0
	set_process(label.percent_visible != 1.0)

func show_text(text: String) -> void:
	label.bbcode_text = text
	label.percent_visible = 0.0
	set_process(true)

# TODO: Appending does not change label.percent_visible.
func add_text(text: String) -> void:
	var err := label.append_bbcode(text)
	if err:
		assert(false, "Can't append text.")
	else:
		set_process(true)
