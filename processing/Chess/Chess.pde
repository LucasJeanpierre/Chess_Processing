/*
*author : Lucas JEANPIERRE
*
*/



Board board;

ArrayList<Case> cases = new ArrayList<Case>();
ArrayList<Piece> pieces = new ArrayList<Piece>();

int caseSize;

void setup() {
    size(500, 500);
    caseSize=width/8;
    board = new Board();
    String[] gameMove = loadStrings("game.txt");
    gameMove[0] = "_";
    saveStrings("game.txt", gameMove);
}


void draw() {

    board.showBoard();
    //after all the piece to get the handled piece over the other
    if (handled) {
        showAvailableCases();
        handledPiece.showPiece();
    }
}
