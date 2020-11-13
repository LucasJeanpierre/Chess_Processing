boolean handled = false;
Piece handledPiece;
Case initCase;

ArrayList<PVector> availableCases = new ArrayList<PVector>();

void mousePressed() {
    reset();
    moveFile();

    int x = mouseX/caseSize;
    int y = mouseY/caseSize;


    //if the player click on a piece and if the piece has the color od the player who is currently playing
    if ( (getPieceByCase(cases.get(getCaseByXY(x, y))) != -1) && (pieces.get(getPieceByCase(cases.get(getCaseByXY(x, y)))).pieceColor == tour) ) {
        handledPiece = pieces.get(getPieceByCase(cases.get(getCaseByXY(x, y))));
        initCase = cases.get(getCaseByXY(x, y));
        //set this piece to player hand
        handledPiece.setHandled(true);
        handled = true;

        //rsemove available cases
        for (int i = availableCases.size()-1; i >= 0; i--) {
            availableCases.remove(i);
        }
        
        //show available cases
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            if (canMove(handledPiece, initCase, c)) {
                availableCases.add(new PVector(c.x*caseSize+caseSize/2, c.y*caseSize+caseSize/2));
            }
        }
    }

    reset();
    moveFile();
}

void mouseReleased() {

    //if a peace is handled
    if (handled) {
        handledPiece.setHandled(false);
        handled = false;

        //get relase case
        int x = mouseX/caseSize;
        int y = mouseY/caseSize;
        Case final_case = cases.get(getCaseByXY(x, y));

        //rebuild the board after show all the available cases
        reset();
        moveFile();
        //test if the move is available
        if (canMove(handledPiece, initCase, final_case)) {
            //add the move to the game file

        //if the move is a castle
            if ( (handledPiece.type == "king") && (abs(handledPiece.pieceCase.x - final_case.x) == 2) && (handledPiece.pieceCase.y == final_case.y) ){
                String[] gameMove = loadStrings("game.txt");
                gameMove[0] += "|" + initCase.name + "." + "castle" + "." + final_case.name;
                saveStrings("game.txt", gameMove);
            } else {
                String[] gameMove = loadStrings("game.txt");
                gameMove[0] += "|" + initCase.name + "." + final_case.name;
                saveStrings("game.txt", gameMove);
            }
        }

        //remove piece of the memory
        handledPiece = null;

    }

    //reset and rebuild the board after had the move to the file
    reset();
    moveFile();
    board.showBoard();


    //check endgame
    if (isCheckMate()) {
        println("CheckMate");
        if (isKingCheck(true)) {
            print("Black won");
        } else {
            print("White won");
        }
        noLoop();
    }

}
