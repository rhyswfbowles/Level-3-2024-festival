extends Node3D
class_name Spawner

@export var data: SpawnerData

var spawnTimer: Timer
var hasItemSpawned: bool = false

func _ready() -> void:
    spawnTimer = Timer.new()
    add_child(spawnTimer)
    spawnTimer.timeout.connect(setNewItem)
    spawnTimer.one_shot = false
    if not hasItemSpawned:
        setNewItem()

func _on_trigger_body_entered(body: Node3D) -> void:
    if body.get_name() == Globals.player.name:
        spawnTimer.start(data.spawnCooldown)
        hasItemSpawned = false

func setNewItem() -> void:
    if hasItemSpawned:
        return
    print("Setting new item")
    var newItemToSpawn: PackedScene = ArrayUtils.getRandomElement(data.itemsToSpawn)
    var instance: Node = newItemToSpawn.instantiate()
    var rigid_body: RigidBody3D = instance.get_child(0).get_node("RigidBody3D")

    instance.name = str(randi())
    instance.global_transform.origin = global_transform.origin + Vector3(0, 1, 0)
    rigid_body.gravity_scale = 0

    add_sibling.call_deferred(instance)

    hasItemSpawned = true
    spawnTimer.stop()
    