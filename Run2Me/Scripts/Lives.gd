extends Control

@onready var parent = $HBoxContainer

func Decrease():
	var lives = parent.get_children()
	if !lives.is_empty():
		parent.remove_child(lives[lives.size()-1])
