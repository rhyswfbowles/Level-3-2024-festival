extends Node3D

@export var item: Item

func _ready():
	var instance = item.model.instantiate()
	add_child(instance)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.get_node("CollisionShape3D") && body.get_node("CollisionShape3D").has_method("on_item_picked_up"):
		body.get_node("CollisionShape3D").call("on_item_picked_up", item)
		queue_free()
