public class Piece {
    private String type;
    private boolean pieceColor;
    private Case pieceCase;
    private PImage image;

    private boolean handled = false;

    public Piece(String type_, boolean pieceColor_, Case pieceCase_) {
        type = type_;
        pieceColor = pieceColor_;
        pieceCase = pieceCase_;
        String image_name = type + getStringColor() + ".png";
        image = loadImage(image_name);
        image.resize(85,85);
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

    public boolean getHandled() {
        return handled;
    }

    public void setHandled(boolean handled_) {
        handled = handled_;
    }

    public void moveTo(int x, int y) {
        Case c = cases.get(getCaseByXY(x,y));
        pieceCase = c;
    }


    public void showPiece() {
        if (!handled) {
           image(image, pieceCase.getX()*100+50, pieceCase.getY()*100+50);
        } else {
           image(image, mouseX, mouseY);
        }
    }
}
