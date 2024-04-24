func move(target_node: KinematicBody2D, desired_direction: Vector2, speed: float = 200): Vector2
  if not target_node.is_kind_of(KinematicBody2D):
      print("WARNING: move() called with invalid node (not a KinematicBody2D)")
      return Vector2.ZERO
  
  desired_direction = desired_direction.normalized()
  
  target_node.move_and_slide(desired_direction * speed)
  
  return desired_direction