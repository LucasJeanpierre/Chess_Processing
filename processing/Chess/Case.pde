public class Case {
    private int x;
    private int y;

    private color white = color(200);
    private color black = color(0,150,150);


    public int getX() {
        return x;
    }

    public int getY() {
        return y;
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
        
        rect(x*100,y*100,100,100);
    }


    public Case(int x_, int y_) {
        x=x_;
        y=y_;
    }
}
