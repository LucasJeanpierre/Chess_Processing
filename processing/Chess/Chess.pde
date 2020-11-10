Plate plate;

ArrayList<Case> cases = new ArrayList<Case>();
ArrayList<Piece> pieces = new ArrayList<Piece>();

void setup() {
    size(800,800);
    plate = new Plate();
}


void draw() {
    plate.showPlate();
    if (handled) {
      handledPiece.showPiece(); 
    }
    //noLoop();
}
