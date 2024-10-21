extends Pickup

func _ready():
    super._ready()
    if data:
        print("Bloodballoon pickup: %s, Cost: %s" % [data.name, data.cost])