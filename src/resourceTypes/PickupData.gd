extends Resource
class_name PickupData

@export var name: String = "PICKUP_DATA"
@export var weight: float = 1.0
@export var cost: float = 1.0
@export_multiline var description: String = "A pickup"
@export var image: Texture2D

@export var canPickup: bool = true
@export var maxStackSize: int = 1