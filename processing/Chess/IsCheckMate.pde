public boolean isCheckMate() {
    if (isKingCheck(true)) {
        for (int i = 0; i < pieces.size(); i++) {
            Piece p = pieces.get(i);
            if (p.pieceColor != true) {
                ArrayList<Case> movableCases = movableCaseForPiece(p);
                for (int j = 0; j < movableCases.size(); j++) {
                    Case c = cases.get(j);
                    if (canMove(p, p.pieceCase, c)) {
                        return false;
                    }
                }
            }
        }
    } else if (isKingCheck(false)) {
        for (int i = 0; i < pieces.size(); i++) {
            Piece p = pieces.get(i);
            if (p.pieceColor != false) {
                ArrayList<Case> movableCases = movableCaseForPiece(p);
                for (int j = 0; j < movableCases.size(); j++) {
                    Case c = cases.get(j);
                    if (canMove(p, p.pieceCase, c)) {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}
