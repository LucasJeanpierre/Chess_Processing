/*
*author : Lucas JEANPIERRE
*This chess game works with a game file which stock all the move already done during the game
*/


Board board;

AI ai;

ArrayList<Case> cases = new ArrayList<Case>();
ArrayList<Piece> pieces = new ArrayList<Piece>();

int caseSize;
boolean tour = true;

void setup() {
    size(800, 800);
    caseSize=width/8;
    board = new Board();
    ai = new AI(0);
    String[] gameMove = loadStrings("game.txt");
    gameMove[0] = "_";
    //saveStrings("game.txt", gameMove);
    reset();
    moveFile();
    board.showBoard();
}


void draw() {

    /*if (!tour) {
        ai.play();
        board.showBoard();
    }*/

    //after all the piece to get the handled piece over the other
    if (handled) {
        board.showBoard();
        showAvailableCases();
        handledPiece.showPiece();
    }


}
