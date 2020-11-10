public class Case {
    private int x;
    private int y;
    private boolean asPieceOn;
    boolean ismovable = false;

    private color white = color(200);
    private color black = color(0, 150, 150);


    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public boolean asPieceOn() {
        return asPieceOn;
    }

    public void setAsPieceOn(boolean asPieceOn_) {
        asPieceOn = asPieceOn_;
    }

    public boolean getColor() {
        if ((x+y)%2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    public void showCase() {
        noStroke();
        if (getColor()) {
            fill(white);
        } else {
            fill(black);
        }

        rect(x*caseSize, y*caseSize, caseSize, caseSize);
        if (ismovable) {
            fill(255, 0, 0);
            ellipse(x*caseSize + caseSize/10, y*caseSize + caseSize/10, caseSize/10, caseSize/10);
        }
    }


    public Case(int x_, int y_) {
        x=x_;
        y=y_;
        //if the case is where the piece will pop
        if ( (y <= 1) || (y >= 6) ) {
            asPieceOn = true;
        }
    }
}
