char letter[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'};

public class Case {
    private int x;
    private int y;
    private String name;
    private boolean asPieceOn;

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
    }


    public Case(int x_, int y_) {
        x=x_;
        y=y_;
        name = letter[x] + str(8-y);
        //if the case is where the piece will pop
        if ( (y <= 1) || (y >= 6) ) {
            asPieceOn = true;
        }
    }
}
