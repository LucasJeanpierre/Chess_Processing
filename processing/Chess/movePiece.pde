public void movePiece(String init, String end) {
    //do a move without write on the game file
    //allow to try a move without change the game state
    //print("movePiece");
    boolean castle = false;
    //if it's a castle move
    if ( (init.equals("e1")) || (init.equals("e8")) ) {
        //all four castle posibility
        if ( ( (init.equals("e1")) && (end.equals("g1")) ) || ( (init.equals("e1")) && (end.equals("c1")) ) || ( (init.equals("e8")) && (end.equals("g8")) ) || ( (init.equals("e8")) && (end.equals("c8")) ) ) {
            //check if it's not just a simple move between e1 and g1 for example
            Piece initp = pieces.get(getPieceByCase(cases.get(getCaseByName(init))));
            if (initp.type == "king") {
                castle = true;
            }

        }
    }


    //le movePiece prend en compte le fichier game mais il faut qu'il prenne en compte la varialble gameMove de l'IA
    String[] gameMove = loadStrings("game.txt");

    if (!castle) {
        gameMove[0] += "|" + init + "." + end;
    } else {
        gameMove[0] += "|" + init + "." +"castle" + "." + end;
    }

    if (gameMove.length == 1) {
        reset();
        gameMove = split(gameMove[0], "|");
        
        for (int i = 1; i < gameMove.length; i++) {
            movePieceByString(gameMove[i]);
        }
        checkEmptyCases();
    }
}


public void moveTestPiece(String init, String end, String[] gameMove) {
    //do a move without write on the game file
    //allow to try a move without change the game state
    //print("movePiece");
    boolean castle = false;
    //if it's a castle move
    if ( (init.equals("e1")) || (init.equals("e8")) ) {
        //all four castle posibility
        if ( ( (init.equals("e1")) && (end.equals("g1")) ) || ( (init.equals("e1")) && (end.equals("c1")) ) || ( (init.equals("e8")) && (end.equals("g8")) ) || ( (init.equals("e8")) && (end.equals("c8")) ) ) {
            //check if it's not just a simple move between e1 and g1 for example
            Piece initp = pieces.get(getPieceByCase(cases.get(getCaseByName(init))));
            if (initp.type == "king") {
                castle = true;
            }

        }
    }


    if (!castle) {
        gameMove = append(gameMove,init + "." + end);
    } else {
        gameMove = append(gameMove,init + "." +"castle" + "." + end);
    }

    if (gameMove.length > 1) {
        reset();
        //gameMove = split(gameMove[0], "|");
        
        for (int i = 1; i < gameMove.length; i++) {
            movePieceByString(gameMove[i]);
        }
        checkEmptyCases();
    }
}
