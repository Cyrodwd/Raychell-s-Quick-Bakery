module kcursor;

import parin;

struct KCursor
{
    Sprite sprite;
    Rect area;
    bool busy;
    bool hidden;

    void create(bool hide = false) {
        setIsCursorVisible(false);
        sprite = Sprite(15, 20, 0, 0);
        sprite.position = mouseScreenPosition();
        area = Rect(sprite.position, sprite.size);

        busy = false;
        hidden = hide;
    }

    void update(float dt) {
        const Vec2 mousePos = mouseScreenPosition();
        if (sprite.position != mousePos)
        {
            sprite.position = mousePos;
        }

        version (KreamyDebug) {
            println ( format("Cursor Busy: {}", busy) );
            println ( format("Cursor Hidden: {}", hidden) );
        }

        // Update mouse area position
        area.position = sprite.position;
    }

    void draw(TextureId cursorAtlas) {
        if (!hidden) {
            drawSprite(cursorAtlas, sprite);
        }
    }
}