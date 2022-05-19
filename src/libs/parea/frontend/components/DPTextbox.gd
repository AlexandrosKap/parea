extends VBoxContainer

var __old_visible_characters := 0 # Used for appending text.
var text_speed := 24.0
onready var text_label: RichTextLabel = $Panel/TextLabel
onready var name_label: RichTextLabel = $Panel/NameLabel

# Hide default text.
func _ready() -> void:
	show_name("")
	show_text("")

# Update text_label.percent_visible until its value is 1.
func _process(delta: float) -> void:
	if __old_visible_characters:
		text_label.visible_characters = __old_visible_characters
		__old_visible_characters = 0
	
	var char_count := text_label.get_total_character_count()
	if char_count:
		text_label.percent_visible += (1.0 / char_count) * text_speed * delta
		if text_label.percent_visible > 1.0:
			text_label.percent_visible = 1.0
	else:
		text_label.percent_visible = 1.0
	set_process(text_label.percent_visible != 1.0)

func show_name(text: String) -> void:
	name_label.bbcode_text = text

func show_text(text: String) -> void:
	text_label.bbcode_text = text
	text_label.visible_characters = 0
	text_label.percent_visible = 0.0
	set_process(true)

func add_text(text: String) -> void:
	var err := text_label.append_bbcode(text)
	if err:
		assert(false, "Can not append text.")
	else:
		if text_label.visible_characters == -1:
			__old_visible_characters = text_label.get_total_character_count()
		else:
			__old_visible_characters = text_label.visible_characters
		set_process(true)

func is_text_visible() -> bool:
	return text_label.percent_visible == 1.0

func make_text_visible() -> void:
	text_label.percent_visible = 1.0

func move_top() -> void:
	alignment = VBoxContainer.ALIGN_BEGIN

func move_mid() -> void:
	alignment = VBoxContainer.ALIGN_CENTER

func move_bot() -> void:
	alignment = VBoxContainer.ALIGN_END
