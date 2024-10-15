import parin;
import kcursor;
import draggable;

private enum uint gameWidth = 340;
private enum uint gameHeight = 450;

private TextureId cursorAtlas;
private KCursor appCursor;
private Draggable demo;

void ready() {
    lockResolution(gameWidth, gameHeight);
    setBackgroundColor(pink);

    cursorAtlas = loadTexture("kcursor_rqb.png");
    appCursor.create();

    demo.create(32, 32, Vec2(0));
}

bool update(float dt) {
    drawDebugText("Raychell's Quick Bakery!", Vec2(8));

    appCursor.update(dt);
    demo.update(dt, appCursor);

    demo.draw(red);
    appCursor.draw(cursorAtlas);


    return false;
}

void finish() { }

mixin runGame!(ready, update, finish);
