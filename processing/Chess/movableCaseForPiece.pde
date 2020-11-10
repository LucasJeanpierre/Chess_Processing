public ArrayList<Case> movableCaseForPiece(Piece p) {
    ArrayList<Case> cases_list = new ArrayList<Case>();
    //if white piece
    if (p.pieceColor == true) {
        //if is a white pawn
        if (p.type == "pawn") {
            //test for all cases
            for (int i = 0; i < cases.size(); i++) {
                Case c = cases.get(i);
                //is this is not the case where the piece is already
                if (p.pieceCase != c) {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if the piece is in diagonal to the pawn
                            if ( (p.pieceCase.x == c.x + 1 ) || (p.pieceCase.x == c.x - 1) ) {
                                if (p.pieceCase.y == c.y + 1 ) {
                                    cases_list.add(c);
                                }
                            }
                        }
                    } else { //if there is no piece on the case
                        //if the case is in the same line as the piece
                        if (p.pieceCase.x == c.x) {
                            //if the case is the case in front of the pawn
                            if (p.pieceCase.y == c.y + 1) { 
                                cases_list.add(c);
                            } else if ( (p.pieceCase.y == c.y + 2 ) && (p.nbmove == 0) ) { //if this is the first move of the pawn and the case is 2 case forward
                                //if their no piece between the case and the piece
                                if (!cases.get(getCaseByXY(c.x,c.y+1)).asPieceOn()) {
                                    cases_list.add(c);
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            if (c != p.pieceCase) {
                cases_list.add(c);
            }
        }
    }
    return cases_list;
}
