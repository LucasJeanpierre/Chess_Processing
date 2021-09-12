/*
* author : Lucas JEANPIERRE
* This chess game works with a game String[] which stock all the move already done during the game
*/

//import java.util.Iterator;
Board board;

AI ai;
int profondeur = 2;

ArrayList<Case> cases = new ArrayList<Case>();
ArrayList<Piece> pieces = new ArrayList<Piece>();

int caseSize;
boolean tour = true;
int nbMoves = 0;
String[] gameMove = new String[0];

void settings() {
    int height = int(displayHeight * 0.8);
    height = int(height / 8) * 8;
    size(height, height);
}

void setup() {
    caseSize = width / 8;
    board = new Board();
    //ai= new AI(1);
    //String[] gameMove = loadStrings("game.txt");
    //gameMove[0] = "20.36";
    //saveStrings("game.txt", gameMove);
    //reset();
    //moveFile();
    //board.showBoard();
}


void draw() {
    
    String start_position = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR";
    String example = "4k2r/6r1/8/8/8/8/3R4/R3K3";
    fenPlace(example);
    board.showBoard();
    noLoop();
    //ai.play();
    /*if (!tour) {
    ai.play();
    nbMoves++;
    board.showBoard();
}
    
    if (handled) {
    board.showBoard();
    showAvailableCases();
    //after all the piece to get the handled piece over the other
    handledPiece.showPiece();
}*/
}
