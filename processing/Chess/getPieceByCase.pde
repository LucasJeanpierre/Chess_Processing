public int getPieceByCase(Case c) {
    for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        if (p.getCase() == c) {
            return i;
        }
    }
    return -1;
}
