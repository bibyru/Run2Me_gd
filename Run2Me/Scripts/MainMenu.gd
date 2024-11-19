extends Control

var record_load = load("res://Objects/Record.tscn")

@onready var SettingsPanel = $SettingsContainer
var idx_master = AudioServer.get_bus_index("Master")
var idx_sound = AudioServer.get_bus_index("Sound")
var idx_music = AudioServer.get_bus_index("Music")

@onready var RecordsPanel = $RecordsContainer
@onready var RecordsParent = $RecordsContainer/MarginContainer/Panel/ScrollContainer/BoxContainer

func _ready():
	RecordsPanel.visible = false
	SettingsPanel.visible = false
	
	AudioServer.set_bus_volume_db(idx_master, linear_to_db(10 * .01))
	AudioServer.set_bus_volume_db(idx_sound, linear_to_db(25 * .01))
	AudioServer.set_bus_volume_db(idx_music, linear_to_db(25 * .01))

func _on_play_pressed():
	get_parent().visible = false
	Manager.GameParent.Start()

func _on_quit_pressed():
	get_tree().quit()

func _on_scores_pressed():
	RecordsPanel.visible = !RecordsPanel.visible
	if RecordsPanel.visible == true:
		SettingsPanel.visible = false
		for child in RecordsParent.get_children():
			RecordsParent.remove_child(child)
		
		if !Manager.records.is_empty():
			for i in Manager.records.size():
				var curr_record = record_load.instantiate()
				RecordsParent.add_child(curr_record)
				curr_record.Fill(i, Manager.records[i][0], Manager.records[i][1])

func _on_settings_pressed():
	SettingsPanel.visible = !SettingsPanel.visible
	if SettingsPanel.visible == true:
		RecordsPanel.visible = false

func VolumeChangeMaster(value):
	AudioServer.set_bus_volume_db(idx_master, linear_to_db(value * .01))

func VolumeChangedSound(value):
	AudioServer.set_bus_volume_db(idx_sound, linear_to_db(value * .01))

func VolumeChangedMusic(value):
	AudioServer.set_bus_volume_db(idx_music, linear_to_db(value * .01))
