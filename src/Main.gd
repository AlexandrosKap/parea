extends Control

onready var parea := $Parea

export(String, FILE, "*.json") var path := ""

func _ready():
	var dialogues: Dictionary = parea.read_json(path)
	parea.show_dialogue(dialogues["En"][0])
