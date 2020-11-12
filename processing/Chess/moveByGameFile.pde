public void moveFile() {
    //get moves of the game
    String[] gameMove = loadStrings("game.txt");
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
    }
}
