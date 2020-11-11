public boolean canMove(Piece p, Case c) {
    //list of all the cases where the piece can go
    ArrayList<Case> movableCases = movableCaseForPiece(p);
    boolean result;
    //if the case in in the list of available cases
    if (isInCaseList(c, movableCases)) {
        //we do the move and test if the king will be check after this move
        //we do it with the test move to not change the game file
        moveTestPiece(initCase.name, c.name);
        //if the king is not chess after this move it's ok
        if (!isKingCheck(p.pieceColor)) {
            result = true;
        } else { //if not the move is not available
            result = false;
        }
        //after the move we reset the board and place the piece like before the test
        reset();
        moveFile();
        return result;
    } else {
        return false;
    }
}
