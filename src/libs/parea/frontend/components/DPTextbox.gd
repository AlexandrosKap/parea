extends VBoxContainer

var __old_visible_characters := 0 # Used for appending text.
var text_speed := 24.0
onready var label: RichTextLabel = $Panel/Margin/HBox/Label

# Hide default text.
func _ready() -> void:
	show_text("")

# Update label.percent_visible until its value is 1.
func _process(delta: float) -> void:
	if __old_visible_characters:
		label.visible_characters = __old_visible_characters
		__old_visible_characters = 0
	
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
	label.visible_characters = 0
	label.percent_visible = 0.0
	set_process(true)

func add_text(text: String) -> void:
	var err := label.append_bbcode(text)
	if err:
		assert(false, "Can not append text.")
	else:
		if label.visible_characters == -1:
			__old_visible_characters = label.get_total_character_count()
		else:
			__old_visible_characters = label.visible_characters
		set_process(true)

func make_text_visible() -> void:
	label.percent_visible = 1.0

func is_text_visible() -> bool:
	return label.percent_visible == 1.0

func move_top() -> void:
	alignment = VBoxContainer.ALIGN_BEGIN

func move_mid() -> void:
	alignment = VBoxContainer.ALIGN_CENTER

func move_bot() -> void:
	alignment = VBoxContainer.ALIGN_END
