import parin;

private enum uint gameWidth = 340;
private enum uint gameHeight = 450;

private TextureId milktank;

void ready() {
    lockResolution(gameWidth, gameHeight);
    setBackgroundColor(pink);
    milktank = loadTexture("milktank.png");
}

bool update(float dt) {
    drawDebugText("Raychell's Quick Bakery!", Vec2(8));
    drawTexture(milktank, Vec2(0), DrawOptions(Vec2(0.6f)));
    return false;
}

void finish() { }

mixin runGame!(ready, update, finish);
