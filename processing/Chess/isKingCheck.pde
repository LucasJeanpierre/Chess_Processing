public boolean isKingCheck(boolean kingColor) {
    King king = (King) pieces.get(getKingByColor(kingColor));
    for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        //if the piece is still on the board
        if (p.pieceCase != null) {
            //if the piece is against the king
            if (p.pieceColor != kingColor) {
                ArrayList<Case> movableCases = movableCaseForPiece(p);
                //if the piece can eat the king
                if (isInCaseList(king.pieceCase, movableCases)) {
                    if (!king.wasCheck) {
                        //for the caslte condition
                        king.wasCheck = true;
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

public boolean isKingCheckTest(boolean kingColor, String[] gameMove) {
    reset();
    moveTestByVar(gameMove);
    King king = (King) pieces.get(getKingByColor(kingColor));
    for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        //if the piece is still on the board
        if (p.pieceCase != null) {
            //if the piece is against the king
            if (p.pieceColor != kingColor) {
                ArrayList<Case> movableCases = movableCaseForPiece(p);
                //if the piece can eat the king
                if (isInCaseList(king.pieceCase, movableCases)) {
                    if (!king.wasCheck) {
                        //for the caslte condition
                        king.wasCheck = true;
                    }
                    return true;
                }
            }
        }
    }
    return false;
}
