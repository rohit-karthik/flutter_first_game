import 'package:first_flutter_game/other_item.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

import 'direction.dart';
import 'player.dart';
import 'world.dart';
import 'other_item.dart';

void main() {
  runApp(
    GameWidget(
      game: MyFirstGame(),
    ),
  );
}

class MyFirstGame extends FlameGame with KeyboardEvents, HasCollisionDetection {
  final Player _player = Player();
  final World _world = World();

  @override
  Future<void> onLoad() async {
    await add(_world);
    await add(OtherItem());
    await add(_player);

    await add(ScreenHitbox());

    _player.position = _world.size / 2;

    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      _player.direction = Direction.up;
      return KeyEventResult.handled;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      _player.direction = Direction.down;
      return KeyEventResult.handled;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      _player.direction = Direction.left;
      return KeyEventResult.handled;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      _player.direction = Direction.right;
      return KeyEventResult.handled;
    } else {
      _player.direction = Direction.none;
      return KeyEventResult.handled;
    }
  }
}
