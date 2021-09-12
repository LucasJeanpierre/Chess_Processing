public boolean isCaseCheck(Case c, boolean pieceColor) {
  for (int i = 0; i < pieces.size(); i++) {
    Piece p = pieces.get(i);
    //if the piece is still on the board
    if ( (p.pieceCase != null) && (p.type != "king") ) {
      //if the piece is against the king
      if (p.pieceColor != pieceColor) {
        ArrayList<Case> movableCases = movableCaseForPiece(p);
        //if the piece can eat the king
        if (isInCaseList(c, movableCases)) {
          return true;
        }
      }
    }
  }
  return false;
}
