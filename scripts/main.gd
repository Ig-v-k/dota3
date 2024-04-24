extends KinematicBody2D

const SPEED = 200  # Adjust movement speed as needed

var velocity = Vector2.ZERO

func _physics_process(delta):
    # Get user input for movement direction
    var move_direction = Vector2.ZERO
    if Input.is_action_pressed("ui_left"):
        move_direction.x = -1
    if Input.is_action_pressed("ui_right"):
        move_direction.x = 1
    if Input.is_action_pressed("ui_up"):
        move_direction.y = 1
    if Input.is_action_pressed("ui_down"):
        move_direction.y = -1

    # Normalize direction to prevent diagonal speedup
    if move_direction != Vector2.ZERO:
        move_direction = move_direction.normalized()

    # Apply movement with collision detection
    velocity = move_direction * SPEED
    velocity = move_and_slide(velocity)

    # Update object position based on velocity
    translate(velocity * delta)