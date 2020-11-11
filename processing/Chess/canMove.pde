public boolean canMove(Piece p, Case c) {
    ArrayList<Case> movableCases = movableCaseForPiece(p);
    boolean result;
    if (isInCaseList(c, movableCases)) {
        moveTestPiece(initCase.name, c.name);
        if (!isKingCheck(p.pieceColor)) {
            result = true;
        } else {
            result = false;
        }
        reset();
        moveFile();
        return result;
    } else {
        return false;
    }
}
