public class King extends Piece {

    public boolean wasCheck = false;
    
    public King(String type_, boolean pieceColor_, Case pieceCase_) {
        super(type_, pieceColor_, pieceCase_);
    }
    
    //redifine the showPiece function for the king -> in red when it's check
    public void showPiece() {
        if (isKingCheck(super.pieceColor)) {
            tint(255, 0, 0);
        }
        if (!super.handled) {
            image(super.image, super.pieceCase.getX()*caseSize+caseSize/2, super.pieceCase.getY()*caseSize+caseSize/2);
        } else {
            image(super.image, mouseX, mouseY);
        }
        noTint();
    }
}
