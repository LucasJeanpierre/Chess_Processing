public int getKingByColor(boolean kingColor) {
    /*for (int i = 0; i < pieces.size(); i++) {
        Piece p = pieces.get(i);
        if ( (p.pieceColor == kingColor) && (p.type == "king") ) {
            return i;
        }
    }*/
    if (kingColor == true) {
        return 0;
    } else if (kingColor == false) {
        return 1;
    }
    return -1;
}