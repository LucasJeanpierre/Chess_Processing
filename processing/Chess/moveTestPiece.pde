public void moveTestPiece(String init, String end) {
    //do a move without write on the game file
    //allow to try a move without change the game state
    String[] gameMove = loadStrings("game.txt");
    gameMove[0] += "|" + init + "." + end;

    if (gameMove.length == 1) {
        reset();
        gameMove = split(gameMove[0], "|");

        for (int i = 1; i < gameMove.length; i++) {
            String init_piece = split(gameMove[i], ".")[0];
            String final_case = split(gameMove[i], ".")[1];

            Case c_init = cases.get(getCaseByName(init_piece));
            Piece piece = pieces.get(getPieceByCase(c_init));
            Case c_final = cases.get(getCaseByName(final_case));

            if (!c_final.asPieceOn()) {
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
