extends Node

var pickupsDict: Dictionary = {}
var pickupsDirectory: String = "res://resources/pickups/"

var pickupNames: Array[String] = [
	"waterballoon",
	"bloodballoon"
]

func _ready() -> void:
	_initialize_pickup_dict()

func _initialize_pickup_dict() -> void:
	for pickup_name in pickupNames:
		var scene_path: String = "%s%s/%s.tscn" % [pickupsDirectory, pickup_name, pickup_name]
		
		var packed_scene: Resource = load(scene_path)
		if packed_scene and packed_scene is PackedScene:
			pickupsDict[pickup_name.to_lower()] = packed_scene
		else:
			push_error("Failed to load scene at path: %s" % scene_path)

func getPickupScene(pickup_name: String) -> PackedScene:
	var lower_name: String = pickup_name.to_lower()
	if pickupsDict.has(lower_name):
		return pickupsDict[lower_name]
	push_error("Pickup not found: %s" % lower_name)
	return null

func getItemDataFromScene(scene: PackedScene) -> PickupData:
	return scene.data
