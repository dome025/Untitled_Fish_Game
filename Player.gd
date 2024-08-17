extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("scale_up"):
		scale.x += 1
		scale.y += 1
		health -= 1
	else:
		if scale.x > 1:
			scale.x -= 1
		if scale.y > 1:
			scale.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
