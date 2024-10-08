extends Area2D

class_name Player;

@export var speed = 400; # How fast the player will move (pixels/sec).
@export var health = 100;
var baseScale = 1;
var scaleUp = 0.25;
var scaleDown = 0.25;
var scaleUpTime = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		return;
	var velocity = Vector2.ZERO; # The player's movement vector.

	if Input.is_action_pressed("move_right"):
		velocity.x += 1;
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1;
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1;
	if Input.is_action_pressed("move_down"):
		velocity.y += 1;

	if Input.is_action_pressed("scale_up"):
		scale.x += scaleUp * 0.5 * scaleUpTime;
		scale.y += scaleUp * 0.5 * scaleUpTime;	
		scaleUpTime += delta;
	else:
		if scale.x > baseScale:
			scale.x = max(scale.x - scaleDown * 0.5 * scaleUpTime, baseScale);
		if scale.y > baseScale:
			scale.y = max(scale.y - scaleDown * 0.5 * scaleUpTime, baseScale);
		if scaleUpTime > 0:
			scaleUpTime = max(scaleUpTime - delta, 0);

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
	
	health = health - 0.5 * delta - scaleUpTime * 0.5;

	position += velocity * delta;


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area is Food:
		health += 5;
		area.queue_free();
