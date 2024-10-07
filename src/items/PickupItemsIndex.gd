extends Node

var pickupsDict: Dictionary = {}
var pickupsDirectory: String = "res://resources/pickups/"

# Pickup names and associated metadata
var pickupNames: Array[String] = [
    "waterballoon",
    "bloodballoon"
]

# Called when the node is ready
func _ready() -> void:
    _initialize_pickup_dict()

# Helper function to initialize the pickup dictionary
func _initialize_pickup_dict() -> void:
    # Populate the dictionary with pickup names and their respective scene paths
    for pickup_name in pickupNames:
        print_debug("Loading pickup: %s" % pickup_name)
        var scene_path = "%s%s/%s.tscn" % [pickupsDirectory, pickup_name, pickup_name]
        
        var packed_scene = load(scene_path)
        if packed_scene and packed_scene is PackedScene:
            pickupsDict[pickup_name.to_lower()] = packed_scene
        else:
            push_error("Failed to load scene at path: %s" % scene_path)

func get_pickup_scene(pickup_name: String) -> PackedScene:
    var lower_name = pickup_name.to_lower()
    if pickupsDict.has(lower_name):
        return pickupsDict[lower_name]
    push_error("Pickup not found: %s" % lower_name)
    return null
