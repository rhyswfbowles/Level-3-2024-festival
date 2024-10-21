class_name HUDManager
extends Control

#region Signals
signal sThrowPowerChanged(value: float)

func sfOnThrowPowerChanged(value: float) -> void:
    print("Throw power changed: %.0f" % value)
    throwPower = value
#endregion Signals

var throwPower: float = 0
@onready var throwPowerLabel: Label = get_node("ThrowPower")

func _ready() -> void:
    sThrowPowerChanged.connect(sfOnThrowPowerChanged)
    throwPowerLabel.text = "Throw Power: %.0f" % throwPower

func _process(_delta: float) -> void:
    throwPowerLabel.text = "Throw Power: %.0f" % throwPower
