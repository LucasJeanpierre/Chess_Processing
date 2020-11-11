public class Piece {
    private String type;
    private boolean pieceColor;
    public Case pieceCase;
    private PImage image;
    private int nbmove = 0;

    private boolean handled = false;

    //temporaire
    public boolean isCheck = false;

    public Piece(String type_, boolean pieceColor_, Case pieceCase_) {
        type = type_;
        pieceColor = pieceColor_;
        pieceCase = pieceCase_;
        String image_name = type + getStringColor() + ".png";
        image = loadImage(image_name);
        image.resize(caseSize, caseSize);
        imageMode(CENTER);
    }

    private String getStringColor() {
        if (pieceColor == true) {
            return "w";
        } else {
            return "b";
        }
    }

    public Case getCase() {
        return pieceCase;
    }

    public void setCase(Case c) {
        pieceCase = c;
    }

    public void eat() {
        pieceCase = null;
    }



    public boolean getHandled() {
        return handled;
    }

    public void setHandled(boolean handled_) {
        handled = handled_;
    }

    public void moveTo(int x, int y) {
        nbmove ++;
        Case c = cases.get(getCaseByXY(x, y));
        c.setAsPieceOn(true);
        pieceCase = c;
    }


    public void showPiece() {
        //if piece still on the board
        if (pieceCase != null) {
            if (!handled) {
                if (isCheck) {
                    tint(255,0,0);
                } else {
                    noTint();
                }
                image(image, pieceCase.getX()*caseSize+caseSize/2, pieceCase.getY()*caseSize+caseSize/2);
            } else {
                image(image, mouseX, mouseY);
            }
        }
    }
}
