public class Pawn extends Piece {

  private PImage queen_image;


  public Pawn(String type_, boolean pieceColor_, Case pieceCase_) {
    super(type_, pieceColor_, pieceCase_);
    String image_name = "queen" + super.getStringColor() + ".png";
    queen_image = loadImage(image_name);
    queen_image.resize(caseSize, caseSize);
  }

  //redifine the showPiece function for pawn -> becama a queen when is on the edge on the board
  public void moveTo(int x, int y) {
    super.nbmove ++;
    Case c = cases.get(getCaseByXY(x, y));
    c.setAsPieceOn(true);
    super.pieceCase = c;

    //if the pawn is on the edge of the board
    if ( ( (super.pieceColor == true) && (c.y == 0) ) || ( (super.pieceColor == false) && (c.y == 7) ) ) {
      super.type = "queen";
    }
  }

  public void showPiece() {
    if (pieceCase != null) {
      if (!super.handled) {
        //if the pawn is became a queen
        if (!super.type.equals("queen")) {
          image(super.image, super.pieceCase.getX()*caseSize+caseSize/2, super.pieceCase.getY()*caseSize+caseSize/2);
        } else {
          image(queen_image, super.pieceCase.getX()*caseSize+caseSize/2, super.pieceCase.getY()*caseSize+caseSize/2);
        }
      } else {
        if (!super.type.equals("queen")) {
          image(super.image, mouseX, mouseY);
        } else {
          image(queen_image, mouseX, mouseY);
        }
      }
    }
  }
}
