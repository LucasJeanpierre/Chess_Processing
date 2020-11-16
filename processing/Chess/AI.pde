class AI {
    private int lvl;

    //private int[] scoreTable = new int[0];
    private ArrayList<String[]> movelist = new ArrayList<String[]>();

    public AI(int lvl_) {
        lvl=lvl_;
    }


    public void play() {
        reset();
        moveFile();
        
        //movelist = new String[0][0];

        String[] gameMoveAI = loadStrings("game.txt");

        gameMoveAI = split(gameMoveAI[0], "|");
        //print(gameMove);

        //lvl 0 random move
        //check all of the possible moves
        //and chose one randomly
        if (lvl == 0) {
            resetMoveList();
            recursiveMove(profondeur, gameMoveAI, false);

            println("move's number analysed :" + movelist.size());

            String moveString = movelist.get(getBestMove(movelist))[0];

            /*for (int i = 0; i < movelist.size(); i++){
                println(movelist.get(i));
            }*/
            
            String move = split(moveString, "|")[nbMoves+1];
            String init = split(move, ".")[0];
            String end = split(move, ".")[1];

            println("move : " + init + "." + end);
            addMove(init, end);
        }
        reset();
        moveFile();
    }

    //play move recursivly
    public void recursiveMove(int nbmove, String[] gameMoveAI, boolean tour) {
        
        if (nbmove > 0) {
            for (int i = 0; i < pieces.size(); i++) {
                Piece p = pieces.get(i);
                //if black piece and still on the board
                if ( (p.pieceColor == tour) && (p.pieceCase != null) ) {
                    for (int j = 0; j < cases.size(); j++) {

                        reset();
                        moveTestByVar(gameMoveAI); 
                        Case c = cases.get(j);
                        
                        if (canMoveTest(p, p.pieceCase, c, gameMoveAI)) {
                            
                            reset();
                            moveTestByVar(gameMoveAI);
                            String[] gameMoveTemp = addTestMove(p.pieceCase.name, c.name, gameMoveAI);
                            recursiveMove(nbmove-1, gameMoveTemp, !tour);
                        }
                    }
                }
            }
        } else {
            int score = evaluatePosition(gameMoveAI);
            String[] scoreString = {join(gameMoveAI, "|"), str(score)};
            movelist.add(scoreString);
        }
        //println(gameMoveTemp);
    }

    private int evaluatePosition(String[] gameMoveAI) {
        reset();
        //println("reset");
        moveTestByVar(gameMoveAI);
        //println("done");
        return int(random(0, 100));
    }

    private String[] addTestMove(String init, String end, String[] gameTestMove) {
        boolean castle = false;
        //if it's a castle move
        if ( (init.equals("e1")) || (init.equals("e8")) ) {
            //all four castle posibility
            if ( ( (init.equals("e1")) && (end.equals("g1")) ) || ( (init.equals("e1")) && (end.equals("c1")) ) || ( (init.equals("e8")) && (end.equals("g8")) ) || ( (init.equals("e8")) && (end.equals("c8")) ) ) {
                //castle = true;
            }
        }

        if (!castle) {
            //gameTestMove[0] += "|" + init + "." + end;
            gameTestMove = append(gameTestMove,  init + "." + end);
        } else {
            //gameTestMove[0] += "|" + init + "." +"castle" + "." + end;
            gameTestMove = append(gameTestMove,  init + "." +"castle" + "." + end);
        }

        return gameTestMove;

    }

    private void addMove(String init, String end) {
        boolean castle = false;
        //if it's a castle move
        if ( (init.equals("e1")) || (init.equals("e8")) ) {
            //all four castle posibility
            if ( ( (init.equals("e1")) && (end.equals("g1")) ) || ( (init.equals("e1")) && (end.equals("c1")) ) || ( (init.equals("e8")) && (end.equals("g8")) ) || ( (init.equals("e8")) && (end.equals("c8")) ) ) {
                Piece initp = pieces.get(getPieceByCase(cases.get(getCaseByName(init))));
                if (initp.type == "king") {
                    castle = true;
                }
            }
        }

        String[] gameMove = loadStrings("game.txt");

        if (!castle) {
            gameMove[0] += "|" + init + "." + end;
        } else {
            gameMove[0] += "|" + init + "." +"castle" + "." + end;
        }

        saveStrings("game.txt", gameMove);
    }

    private void resetMoveList() {
        for (int i = movelist.size() - 1 ; i >= 0; i--) {
            movelist.remove(i);
        }
    }
}
