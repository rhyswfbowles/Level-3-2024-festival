extends Node3D
class_name Pickup

@export var data: PickupData

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.get_node("CollisionShape3D") && body.get_node("CollisionShape3D").has_method("onItemPickedUp") && data.canPickup:
		body.get_node("CollisionShape3D").onItemPickedUp(data)
		queue_free()