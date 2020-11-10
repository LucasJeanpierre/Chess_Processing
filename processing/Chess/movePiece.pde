boolean handled = false;
Piece handledPiece;

void mousePressed() {
    
    int x = mouseX/100;
    int y = mouseY/100;

    //get chosen piece
    handledPiece = pieces.get(getPieceByCase(cases.get(getCaseByXY(x,y))));
    //set this piece to player hand
    handledPiece.setHandled(true);
    handled = true;
}

void mouseReleased() {
    //get relase case
    int x = mouseX/100;
    int y = mouseY/100;

    //move piece to released case
    handledPiece.moveTo(x,y);

    //release piece
    handledPiece.setHandled(false);
    handled = false;

    //remove piece of the memory
    handledPiece = null;
}