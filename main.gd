extends Node

var foodCount = 0;
var spawn_object = preload("res://food.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if foodCount < 40:
		var instance = spawn_object.instantiate();
		instance.position.x = randi() % 1000;
		instance.position.y = randi() % 1000;
		instance.scale.x = 1;
		instance.scale.y = 1;
		add_child(instance);
		foodCount += 1;
	
