module bread;

import parin;
import draggable;
import kcursor;
import std.concurrency;

private enum ubyte breadSpriteSize = 32;

enum BreadType : ubyte {
    integral = 0,
    toasted = 1,
    white = 2,
}

struct Bread
{
    Draggable base;
    SpriteAnimation baseAnim;
    BreadType type;
    Sprite sprite;

    void create(const Vec2 position, BreadType newType) {
        base.create(breadSpriteSize, breadSpriteSize, position);
        sprite = Sprite(breadSpriteSize, breadSpriteSize, 0, 0);
        baseAnim = SpriteAnimation(newType, 0, 0);
        type = newType;
    }

    void update(ref KCursor cursor) {
        base.update(cursor);
        sprite.position = base.actualPosition;
        sprite.play(baseAnim);
    }

    void draw(TextureId breadAtlas) {
        version (KreamyDebug) base.draw();
        drawSprite(breadAtlas, sprite);
    }
}