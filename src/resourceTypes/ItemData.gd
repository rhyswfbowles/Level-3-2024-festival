class_name ItemData
extends Resource

@export var name: String
@export_multiline var description: String
@export var image: Texture2D
@export var weight: float = 1.0
@export var value: int = 0
@export var stackable: bool = false
@export var prefab: PackedScene
@export var pickable: bool = true
