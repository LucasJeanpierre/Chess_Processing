public void movePiece(String init, String end) {
    //do a move without write on the game file
    //allow to try a move without change the game state

    boolean castle = false;
    //if it's a castle move
    if ( (init.equals("e1")) || (init.equals("e8")) ) {
        //all four castle posibility
        if ( ( (init.equals("e1")) && (end.equals("g1")) ) || ( (init.equals("e1")) && (end.equals("c1")) ) || ( (init.equals("e8")) && (end.equals("g8")) ) || ( (init.equals("e8")) && (end.equals("c8")) ) ) {
            castle = true;
        }
    }

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
