public void checkEmptyCases() {
    //clear all cases
    for (int i = 0; i < cases.size(); i++) {
        cases.get(i).asPieceOn = false;
    }

    //reset aspieceon parameters for all the cases
    for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        if (p.pieceCase != null) {
            p.pieceCase.asPieceOn = true;
        }
    }
}
