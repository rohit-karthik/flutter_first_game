import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class OtherItem extends SpriteComponent with HasGameRef {
  OtherItem() : super(size: Vector2.all(50.0));

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = await gameRef.loadSprite('item_image.jpeg');

    add(RectangleHitbox());
  }
}
