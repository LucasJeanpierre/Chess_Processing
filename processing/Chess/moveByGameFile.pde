public void moveFile() {
    //get moves of the game
    /*String[] gameMove = loadStrings("game.txt");
     //if at list one move have been done
     if (gameMove.length == 1) {
     gameMove = split(gameMove[0], "|");
     
     reset();
     //for all the move done
     for (int i = 1; i < gameMove.length; i++) {
     movePieceByString(gameMove[i]);
     //change player
     tour=!tour;
     }
     checkEmptyCases();
     }*/



    reset();
    //for all the move done
    if (gameMove.length > 0) {
        for (int i = 0; i < gameMove.length; i++) {
            movePieceByString(gameMove[i]);
            //change player
            tour=!tour;
        }
    }
    checkEmptyCases();
}

public void moveTestByVar(String[] gameMove) {
    //give a position according to a variable

    //if at list one move have been done

    //gameMove = split(gameMove, "|");

    reset();
    //for all the move done
    for (int i = 0; i < gameMove.length; i++) {
        //println("moveTestByVar : " + gameMove[i] );
        movePieceByString(gameMove[i]);
        //change player
        tour=!tour;
    }
    checkEmptyCases();
}
