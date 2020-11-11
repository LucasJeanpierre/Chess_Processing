public void reset() {
    //reset cases
    for (int i = 0; i < cases.size(); i++) {
        Case c = cases.get(i);
        if ( (c.y <= 1) || (c.y >= 6) ) {
            c.asPieceOn = true;
        } else {
            c.asPieceOn = false;
        }
    }

    //reset pieces
    for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        p.nbmove = 0;
    }

    //replace pieces
    pieces.get(0).pieceCase = cases.get(60);
    pieces.get(1).pieceCase = cases.get(4);
    pieces.get(2).pieceCase = cases.get(59);
    pieces.get(3).pieceCase = cases.get(3);
    pieces.get(4).pieceCase = cases.get(63);
    pieces.get(5).pieceCase = cases.get(56);
    pieces.get(6).pieceCase = cases.get(0);
    pieces.get(7).pieceCase = cases.get(7);
    pieces.get(8).pieceCase = cases.get(61);
    pieces.get(9).pieceCase = cases.get(58);
    pieces.get(10).pieceCase = cases.get(2);
    pieces.get(11).pieceCase = cases.get(5);
    pieces.get(12).pieceCase = cases.get(62);
    pieces.get(13).pieceCase = cases.get(57);
    pieces.get(14).pieceCase = cases.get(1);
    pieces.get(15).pieceCase = cases.get(6);

    int nbCase = 48;

    for (int i = 16; i < 24; i++) {
        pieces.get(i).pieceCase = cases.get(nbCase);
        nbCase++;
    }

    nbCase = 8;

    for (int i = 24; i < 32; i++) {
        pieces.get(i).pieceCase = cases.get(nbCase);
        nbCase++;
    }
}
