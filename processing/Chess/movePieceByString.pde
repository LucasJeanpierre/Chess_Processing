public void movePieceByString_old(String string) {
    //move one Piece accord the string given in arguement
    //if not a caste move
    if (!split(string, ".")[1].equals("castle")) {

        String init_piece = split(string, ".")[0];
        String final_case = split(string, ".")[1];

        //println("movePieceByString : " +string);

        //get the initial and final cases and the piece
        //println(init_piece + "." + final_case);
        //println(init_piece);
        //println(string);
        Case c_init = cases.get(getCaseByName(init_piece));
        Piece piece = pieces.get(getPieceByCase(c_init));
        Case c_final = cases.get(getCaseByName(final_case));

        //if their is no piece in the case
        if (!c_final.asPieceOn()) {
            //we just move the piece to the final case and set the initial one empty
            piece.pieceCase.asPieceOn = false;
            piece.moveTo(c_final.x, c_final.y);
        } else { // if their is a piece we need to put the piece out of the board
            Piece finale_piece = pieces.get(getPieceByCase(c_final));
            finale_piece.eat();
            piece.pieceCase.asPieceOn = false;
            piece.moveTo(c_final.x, c_final.y);
        }
    } else {//if it's a castle
        String init_piece = split(string, ".")[0];
        String final_case = split(string, ".")[2];

        //get the initial and final cases and the piece
        Case c_init = cases.get(getCaseByName(init_piece));
        Piece king = pieces.get(getPieceByCase(c_init));
        Case c_final = cases.get(getCaseByName(final_case));

        //get the rook according the castle case
        if (c_final.name.equals("g1")) {
            Piece rook = pieces.get(4);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(5, 7);
        } else if (c_final.name.equals("c1")) {
            Piece rook = pieces.get(5);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(3, 7);
        } else if (c_final.name.equals("g8")) {
            Piece rook = pieces.get(7);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(5, 0);
        } else if (c_final.name.equals("c8")) {
            Piece rook = pieces.get(6);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(3, 0);
        }
    }
}


public void movePieceByString(String string) {
    //move one Piece accord the string given in arguement
    //if not a caste move
    println("string : "+string);
    if (!split(string, ".")[1].equals("castle")) {

        //String init_piece = split(string, ".")[0];
        //String final_case = split(string, ".")[1];
        Piece piece = pieces.get(int(split(string, ".")[0]));
        Case c_final = cases.get(int(split(string, ".")[1]));

        //println("movePieceByString : " +string);

        //get the initial and final cases and the piece
        //println(init_piece + "." + final_case);
        //println(init_piece);
        //println(string);
        //Case c_init = cases.get(getCaseByName(init_piece));
        //Piece piece = pieces.get(getPieceByCase(c_init));
        //Case c_final = cases.get(getCaseByName(final_case));
        println(piece.type + " " + c_final.name);

        //if their is no piece in the case
        if (!c_final.asPieceOn()) {
            //we just move the piece to the final case and set the initial one empty
            piece.pieceCase.asPieceOn = false;
            piece.moveTo(c_final.x, c_final.y);
        } else { // if their is a piece we need to put the piece out of the board
            Piece finale_piece = pieces.get(int(split(string, ".")[2]));
            finale_piece.eat();
            piece.pieceCase.asPieceOn = false;
            piece.moveTo(c_final.x, c_final.y);
        }
    } else {//if it's a castle
        //String init_piece = split(string, ".")[0];
        //String final_case = split(string, ".")[2];


        Piece king = pieces.get(int(split(string, ".")[0]));
        Case c_final = cases.get(int(split(string, ".")[2]));

        //get the initial and final cases and the piece
        //Case c_init = cases.get(getCaseByName(init_piece));
        //Piece king = pieces.get(getPieceByCase(c_init));
        //Case c_final = cases.get(getCaseByName(final_case));

        //get the rook according the castle case
        if (c_final.name.equals("g1")) {
            Piece rook = pieces.get(4);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(5, 7);
        } else if (c_final.name.equals("c1")) {
            Piece rook = pieces.get(5);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(3, 7);
        } else if (c_final.name.equals("g8")) {
            Piece rook = pieces.get(7);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(5, 0);
        } else if (c_final.name.equals("c8")) {
            Piece rook = pieces.get(6);
            //set the old case empty
            king.pieceCase.asPieceOn = false;
            rook.pieceCase.asPieceOn = false;
            //move the 2 pieces
            king.moveTo(c_final.x, c_final.y);
            rook.moveTo(3, 0);
        }
    }
}
