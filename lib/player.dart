import 'package:flame/components.dart';
import 'direction.dart';

class Player extends SpriteComponent with HasGameRef {
  Player() : super(size: Vector2.all(50.0));

  Direction direction = Direction.none;

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  void movePlayer(double dt) {
    switch (direction) {
      case Direction.up:
        moveUp(dt);
        break;
      case Direction.down:
        moveDown(dt);
        break;
      case Direction.left:
        moveLeft(dt);
        break;
      case Direction.right:
        moveRight(dt);
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
  }
}
