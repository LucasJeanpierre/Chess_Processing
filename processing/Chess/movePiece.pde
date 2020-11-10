boolean handled = false;
Piece handledPiece;

ArrayList<Case> tempo = new ArrayList<Case>();

void mousePressed() {

    int x = mouseX/caseSize;
    int y = mouseY/caseSize;


    //get chosen piece
    if (getPieceByCase(cases.get(getCaseByXY(x, y))) != -1) {
        handledPiece = pieces.get(getPieceByCase(cases.get(getCaseByXY(x, y))));
        //set this piece to player hand
        handledPiece.setHandled(true);
        handled = true;


        tempo = movableCaseForPiece(handledPiece);
        for (int i = 0; i < tempo.size(); i++) {
            Case c = tempo.get(i);
            c.ismovable = true;
        }
    }
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
        if (canMove(handledPiece, final_case)) {
            //if their is no piece on the final case
            //we just move the piece and set the old case empy 
            if (!final_case.asPieceOn()) {
                //move piece to released case
                handledPiece.pieceCase.asPieceOn = false;
                handledPiece.moveTo(x, y);
            } else { // if their is a piece we need to put the piece out of the board
                Piece finale_piece = pieces.get(getPieceByCase(final_case));
                finale_piece.eat();
                handledPiece.pieceCase.asPieceOn = false;
                handledPiece.moveTo(x, y);
            }
        }

        //remove piece of the memory
        handledPiece = null;

        for (int i = 0; i < tempo.size(); i++) {
            Case c = tempo.get(i);
            c.ismovable = false;
        }
    }
}
