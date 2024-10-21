extends Node

@onready var world: Node = get_tree().root.get_node("world")
@onready var player: Node = world.get_node("Player")
@onready var hud: Node= player.get_node("HUD")
@onready var inventory: Node = hud.get_node("Inventory")
