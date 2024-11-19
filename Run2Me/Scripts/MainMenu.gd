extends Control

var record_load = load("res://Objects/Record.tscn")

@onready var Records = $RecordsContainer
@onready var RecordsParent = $RecordsContainer/MarginContainer/Panel/ScrollContainer/BoxContainer

func _ready():
	Records.visible = false

func _on_play_pressed():
	get_parent().visible = false
	Manager.GameParent.Start()

func _on_quit_pressed():
	get_tree().quit()

func _on_scores_pressed():
	Records.visible = !Records.visible
	for child in RecordsParent.get_children():
		RecordsParent.remove_child(child)
	
	if !Manager.records.is_empty():
		for i in Manager.records.size():
			var curr_record = record_load.instantiate()
			RecordsParent.add_child(curr_record)
			curr_record.Fill(i, Manager.records[i][0], Manager.records[i][1])
