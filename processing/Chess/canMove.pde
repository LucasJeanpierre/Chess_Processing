public boolean canMove(Piece p, Case c) {
    ArrayList<Case> movableCases = movableCaseForPiece(p);
    if (isInCaseList(c, movableCases)) {
        return true;
    } else {
        return false;
    }
}
