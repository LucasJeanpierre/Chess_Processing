public int getKingByColor(boolean kingColor) {
    for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        if ( (p.pieceColor == kingColor) && (p.type == "king") ) {
            return i;
        }
    }
    return -1;
}