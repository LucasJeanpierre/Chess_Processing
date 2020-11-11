boolean handled = false;
Piece handledPiece;
Case initCase;

ArrayList<PVector> availableCases = new ArrayList<PVector>();

void mousePressed() {
    reset();
    moveFile();

    int x = mouseX/caseSize;
    int y = mouseY/caseSize;


    //get chosen piece
    if (getPieceByCase(cases.get(getCaseByXY(x, y))) != -1) {
        handledPiece = pieces.get(getPieceByCase(cases.get(getCaseByXY(x, y))));
        initCase = cases.get(getCaseByXY(x, y));
        //set this piece to player hand
        handledPiece.setHandled(true);
        handled = true;

        //rsemove available cases
        for (int i = availableCases.size()-1; i >= 0; i--) {
            availableCases.remove(i);
        }
        println(availableCases.size());
        //show available cases
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            if (canMove(handledPiece, c)) {
                availableCases.add(new PVector(c.x*caseSize+caseSize/2, c.y*caseSize+caseSize/2));
            }
        }
    }

    reset();
    moveFile();
}

void mouseReleased() {

    //release piece
    if (handled) {
        handledPiece.setHandled(false);
        handled = false;

        //get relase case
        int x = mouseX/caseSize;
        int y = mouseY/caseSize;
        Case final_case = cases.get(getCaseByXY(x, y));

        //if we can do this move
        reset();
        moveFile();
        if (canMove(handledPiece, final_case)) {
            String[] gameMove = loadStrings("game.txt");
            gameMove[0] += "|" + initCase.name + "." + final_case.name;
            saveStrings("game.txt", gameMove);
        }

        //remove piece of the memory
        handledPiece = null;

        //remove available cases
        for (int i = 0; i < availableCases.size(); i++) {
            availableCases.remove(i);
        }
    }

    reset();
    moveFile();


    if (isKingCheck(true)) {
        Piece king = pieces.get(getKingByColor(true));
        king.isCheck = true;
    } else {
        Piece king = pieces.get(getKingByColor(true));
        king.isCheck = false;
    }
}
