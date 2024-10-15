module app;

import parin;
import game;

private enum ushort gameWidth = 320;
private enum ushort gameHeight = 450;

void ready() {
    rqbGame = Game(gameWidth, gameHeight);
    rqbGame.ready();
}

bool update(float dt) {
    version (WebAssembly) {
        drawDebugText("In the web dude!", Vec2(0));
    }

    if (rqbGame.update(dt)) return true;
    rqbGame.draw();

    return false;
}

void finish() { 
    rqbGame.draw();
}

mixin runGame!(ready, update, finish, gameWidth, gameHeight, "Raychell's Quick Bakery");
