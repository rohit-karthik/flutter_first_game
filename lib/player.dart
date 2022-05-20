import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'direction.dart';
import 'other_item.dart';
import 'world.dart';

class Player extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Player() : super(size: Vector2.all(50.0));

  Direction direction = Direction.none;
  final List<Direction> _notAllowed = [];

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is ScreenHitbox && position.x <= 0) {
      _notAllowed.add(Direction.left);
    }
    if (other is ScreenHitbox && position.y <= 0) {
      _notAllowed.add(Direction.up);
    }
    if (other is ScreenHitbox && position.x >= World.worldSize.x - 50) {
      _notAllowed.add(Direction.right);
    }
    if (other is ScreenHitbox && position.y >= World.worldSize.y - 50) {
      _notAllowed.add(Direction.down);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    _notAllowed.removeRange(0, _notAllowed.length);
  }

  void movePlayer(double dt) {
    switch (direction) {
      case Direction.up:
        if (!_notAllowed.contains(Direction.up)) moveUp(dt);
        break;
      case Direction.down:
        if (!_notAllowed.contains(Direction.down)) moveDown(dt);
        break;
      case Direction.left:
        if (!_notAllowed.contains(Direction.left)) moveLeft(dt);
        break;
      case Direction.right:
        if (!_notAllowed.contains(Direction.right)) moveRight(dt);
        break;
      default:
        break;
    }
  }

  void moveUp(double dt) {
    position.add(Vector2(0, -(dt * 300.0)));
  }

  void moveDown(double dt) {
    position.add(Vector2(0, dt * 300.0));
  }

  void moveLeft(double dt) {
    position.add(Vector2(-(dt * 300.0), 0));
  }

  void moveRight(double dt) {
    position.add(Vector2(dt * 300.0, 0));
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = await gameRef.loadSprite('player_image.png');

    add(RectangleHitbox());
  }
}
