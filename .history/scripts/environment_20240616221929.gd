extends Node3D

func _ready():
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
    if event.is_action_pressed("exit"):
        get_tree().quit()