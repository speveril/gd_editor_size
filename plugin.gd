@tool
extends EditorPlugin

var editor_settings
var window

func _enter_tree():
	if not Engine.is_editor_hint():
		queue_free()
		return
	
	editor_settings = get_editor_interface().get_editor_settings()
	window = get_window()
	
	if editor_settings.get_setting("editor_size/window_size") == null:
		_write_settings()
	_load_settings()

func _exit_tree():
	_write_settings()

func _write_settings():
	editor_settings.set_setting("editor_size/window_size", DisplayServer.window_get_size())
	editor_settings.set_setting("editor_size/window_mode", DisplayServer.window_get_mode())
	editor_settings.set_setting("editor_size/window_pos", window.position)

func _load_settings():
	DisplayServer.window_set_mode(editor_settings.get_setting("editor_size/window_mode"))
	DisplayServer.window_set_size(editor_settings.get_setting("editor_size/window_size"))
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		if editor_settings.get_setting("editor_size/window_pos") == null:
			var screen_id = DisplayServer.get_primary_screen()
			var screen_size = DisplayServer.screen_get_size(screen_id)
			var screen_pos = DisplayServer.screen_get_position(screen_id)
			DisplayServer.window_set_position(screen_pos + screen_size / 2 - DisplayServer.window_get_size() / 2)
		else:
			window.position = editor_settings.get_setting("editor_size/window_pos")

