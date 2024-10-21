extends Resource
class_name SpawnerData

@export var itemsToSpawn: Array[PackedScene] = []
@export var spawnCooldown: float = 5.00
@export_range(1, 20) var spawnAmount: int = 1