public boolean canMove(Piece p, Case c) {
    ArrayList<Case> movableCases = movableCaseForPiece(p);
    boolean result;
    if (isInCaseList(c, movableCases)) {
        reset();
        moveTestPiece(initCase.name, c.name);
        if (!isKingCheck(p.pieceColor)) {
            result = true;
        } else {
            result = false;
        }
        //reset();
        return result;
    } else {
        return false;
    }
}
