public class Board {


    public Board() {
        //init cases
        for (int y = 0; y < 8; y++) {
            for (int x = 0; x < 8; x++) {
                cases.add(new Case(x, y));
            }
        }

        //init pieces
        //white king
        pieces.add(new King("king", true, cases.get(60)));
        //black king
        pieces.add(new King("king", false, cases.get(4)));

        //white queen
        pieces.add(new Piece("queen", true, cases.get(59)));
        //black queen
        pieces.add(new Piece("queen", false, cases.get(3)));

        //white rook
        pieces.add(new Piece("rook", true, cases.get(63)));
        pieces.add(new Piece("rook", true, cases.get(56)));

        //black rook
        pieces.add(new Piece("rook", false, cases.get(0)));
        pieces.add(new Piece("rook", false, cases.get(7)));

        //white bishop
        pieces.add(new Piece("bishop", true, cases.get(61)));
        pieces.add(new Piece("bishop", true, cases.get(58)));

        //black bishop
        pieces.add(new Piece("bishop", false, cases.get(2)));
        pieces.add(new Piece("bishop", false, cases.get(5)));

        //white knight
        pieces.add(new Piece("knight", true, cases.get(62)));
        pieces.add(new Piece("knight", true, cases.get(57)));

        //black knight
        pieces.add(new Piece("knight", false, cases.get(1)));
        pieces.add(new Piece("knight", false, cases.get(6)));

        //white pawns
        for (int i = 48; i < 56; i++) {
            pieces.add(new Pawn("pawn", true, cases.get(i)));
        }  

        //black pawns
        for (int i = 8; i < 16; i++) {
            pieces.add(new Pawn("pawn", false, cases.get(i)));
        }

        for (int i = 0; i < pieces.size(); i++) {
            pieces.get(i).numberPiece = i;
        }
    }


    public void showBoard() {
        //show cases
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            c.showCase();
        }

        //show pieces
        for (int i = 0; i < pieces.size(); i++) {
            Piece p = pieces.get(i);
            p.showPiece();
        }
    }
}
