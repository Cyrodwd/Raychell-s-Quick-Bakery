module game;

import parin;
import kcursor;

struct Game
{
    ushort width;
    ushort height;
    string title;

    TextureId cursorAtlas;
    
    KCursor cursor;

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

        cursor.create();
    }

    bool update(float dt) {
        cursor.update(dt);
        return false;
    }

    void draw() {
        cursor.draw(cursorAtlas);
    }

    void finish() {
        println("It worked!");
    }
}

extern(D) Game rqbGame;