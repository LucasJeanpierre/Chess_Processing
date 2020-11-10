Board board;

ArrayList<Case> cases = new ArrayList<Case>();
ArrayList<Piece> pieces = new ArrayList<Piece>();

int caseSize;

void setup() {
    size(400, 400);
    caseSize=width/8;
    board = new Board();
}


void draw() {
    board.showBoard();
    //after all the piece to get the handled piece over the other
    if (handled) {
        handledPiece.showPiece();
    }
    //noLoop();
}
