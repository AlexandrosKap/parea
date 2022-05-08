extends Control

onready var ui := $PareaUI

func _ready():
	ui.play("level1/bob")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		ui.play("level1/bob")
