import 'package:flame/components.dart';

class World extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = await gameRef.loadSprite('world_image.jpeg');
    size = sprite!.originalSize / 1.25;
  }
}
