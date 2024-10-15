module draggable;

import parin;
import kcursor;

struct Draggable
{
    Rect area;
    Vec2 ogPosition;
    Vec2 actualPosition;
    bool selected;

    void create(uint width, uint height, Vec2 position) {
        ogPosition = position;
        actualPosition = position;
        area = Rect(position, Vec2(width, height));
    }

    void update(float dt, ref KCursor cursor) {
        if (area.hasIntersection(cursor.area)) {
            if (isDown(Mouse.left) && !selected) {
                cursor.busy = true;
                selected = true;
            }
        }

        if (selected) {
            actualPosition = cursor.sprite.position;
            actualPosition -= cursor.sprite.size() / Vec2(2); // Parin is cool lol.
        }

        if (selected && isReleased(Mouse.left)) {
            actualPosition = ogPosition;
            selected = false;
        }

        area.position = actualPosition;
    }

    debug void draw(Color color = white) {
        drawRect(area, color);
    }
}