Board board;

ArrayList<Case> cases = new ArrayList<Case>();
ArrayList<Piece> pieces = new ArrayList<Piece>();

int caseSize;

void setup() {
    size(800, 800);
    caseSize=width/8;
    board = new Board();
    moveFile();
    //reset();
}


void draw() {

    board.showBoard();
    //after all the piece to get the handled piece over the other
    if (handled) {
        handledPiece.showPiece();
    }
    //printMove();
    //noLoop();
}
