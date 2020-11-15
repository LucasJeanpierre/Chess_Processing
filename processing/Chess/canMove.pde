public boolean canMove(Piece p, Case c1, Case c2) {
    //list of all the cases where the piece can go
    ArrayList<Case> movableCases = movableCaseForPiece(p);
    boolean result;
    //if the case in in the list of available cases
    if (isInCaseList(c2, movableCases)) {
        //we do the move and test if the king will be check after this move
        //we do it with the test move to not change the game file
        movePiece(c1.name, c2.name);
        //print("test");
        //if the king is not chess after this move it's ok
        if (!isKingCheck(p.pieceColor)) {
            result = true;
        } else { //if not the move is not available
            result = false;
        }
        //after the move we reset the board and place the piece like before the test
        reset();
        moveFile();
        return result;
    } else {
        return false;
    }
}

public boolean canMoveTest(Piece p, Case c1, Case c2, String[] gameMove) {
    //list of all the cases where the piece can go
    ArrayList<Case> movableCases = movableCaseForPiece(p);
    boolean result;
    //if the case in in the list of available cases
    if (isInCaseList(c2, movableCases)) {
        reset();
        moveTestByVar(gameMove);
        //we do the move and test if the king will be check after this move
        //Piece tempp = pieces.get(1);
        //println(tempp.pieceCase.name);

        //println("------------");
        //we do it with the test move to not change the game file
        moveTestPiece(c1.name, c2.name, gameMove);
        //print("test");
        //if the king is not chess after this move it's ok
        
        //println(tempp.pieceCase.name);

        //println("------------");


        if (!isKingCheck(p.pieceColor)) {
            //print("bonsoir");
            result = true;
        } else { //if not the move is not available
            result = false;
        }
        //result = true;
        //after the move we reset the board and place the piece like before the test
        reset();
        moveTestByVar(gameMove);
        //moveFile();
        return result;
    } else {
        return false;
    }
}
