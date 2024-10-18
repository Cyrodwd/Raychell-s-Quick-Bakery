module game;

import parin;
import kcursor;
import bread;

struct Game
{
    ushort width;
    ushort height;
    string title;

    TextureId cursorAtlas;
    TextureId breadsAtlas;
    
    KCursor cursor;
    Bread integralBread;
    Bread whiteBread;
    Bread toastBread;

    this (ushort width, ushort height) {
        if (width <= ushort.max && height <= ushort.max) {
            this.width = width;
            this.height = height;
        }
        
        title = "Raychell's Quick Backery";
    }

    void ready() {
        lockResolution(width, height);
        setBackgroundColor(pink);

        cursorAtlas = loadTexture("kcursor_rqb.png");
        breadsAtlas = loadTexture("test_bread.png");

        cursor.create();
        
        integralBread.create(Vec2(0), BreadType.integral);
        whiteBread.create(Vec2(50), BreadType.white);
        toastBread.create(Vec2(90), BreadType.toasted);
    }

    bool update(float dt) {
        cursor.update(dt);

        integralBread.update(cursor);
        whiteBread.update(cursor);
        toastBread.update(cursor);

        return false;
    }

    void draw() {
        integralBread.draw(breadsAtlas);
        whiteBread.draw(breadsAtlas);
        toastBread.draw(breadsAtlas);
        cursor.draw(cursorAtlas);
    }

    void finish() {
        println("It worked!");
    }
}

extern(D) Game rqbGame;