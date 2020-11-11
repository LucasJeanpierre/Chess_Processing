public void printMove() {
    //get the file who list all the movs done until now
    String[] gameMove = loadStrings("game.txt");
    gameMove = split(gameMove[0], "|");

    for (int i = 0; i < gameMove.length; i++) {
        String init_piece = split(gameMove[i], ".")[0];
        String piece = split(gameMove[i], ".")[1];
        String final_case = split(gameMove[i], ".")[2];
        print(init_piece);
        println(piece);
        println(final_case);
    }
}


public void moveFile() {
    //get moves of the game
    String[] gameMove = loadStrings("game.txt");
    //if at list one move have been done
    if (gameMove.length == 1) {
        gameMove = split(gameMove[0], "|");

        //for all the move done
        for (int i = 1; i < gameMove.length; i++) {
            String init_piece = split(gameMove[i], ".")[0];
            String final_case = split(gameMove[i], ".")[1];

            //get the initial and final cases and the piece
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
        }
    }
}
