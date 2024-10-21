extends Node
class_name Actions

const throwMultiplierPerSecond: float = 50
const maxThrowPower: float = 50
const thrownLifetimeInSeconds: float = 1

var throwPower: float = 0
var lifecycleTimer: Timer

# func _ready() -> void:
#     lifecycleTimer = Timer.new()
#     add_child(lifecycleTimer)
#     lifecycleTimer.one_shot = true
#     lifecycleTimer.timeout.connect(cleanUp)

func throwItem(item_scene: PackedScene) -> void:
    var camera: Camera3D = Globals.player.get_viewport().get_camera_3d()
    var camera_transform: Transform3D = camera.global_transform
    var forward: Vector3 = -camera_transform.basis.z

    var thrown_item: Node = item_scene.instantiate()
    var rigid_body: RigidBody3D = thrown_item.get_child(0).get_node("RigidBody3D")
    thrown_item.global_transform.origin = camera_transform.origin + forward * 2
    # lifecycleTimer.start(thrownLifetimeInSeconds)
    
    rigid_body.linear_velocity = forward * throwPower

    Globals.world.add_child(thrown_item)
    resetThrowPower()

func increaseThrowPower(delta: float) -> void:
    if throwPower >= maxThrowPower:
        throwPower = roundi(maxThrowPower)
        return

    throwPower += delta * throwMultiplierPerSecond

    Globals.hud.sThrowPowerChanged.emit(roundi(throwPower))

func resetThrowPower() -> void:
    throwPower = 0
    Globals.hud.sThrowPowerChanged.emit(throwPower)

func cleanUp() -> void:
    print("Cleaning up")
    # lifecycleTimer.stop()
    queue_free()