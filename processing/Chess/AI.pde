class AI {
    private int lvl;

    public AI(int lvl_) {
        lvl=lvl_;
    }

    public void tempoPlay() {
        addMove("e7", "e5");
        reset();
        moveFile();
    }

    public void play() {
        reset();
        moveFile();
        String[] movelist;
        movelist = new String[0];

        //lvl 0 random move
        //check all of the possible moves
        //and chose one randomly
        if (lvl == 0) {
            for (int i = 0; i < pieces.size(); i++) {
                Piece p = pieces.get(i);
                //if black piece and still on the board
                if ( (p.pieceColor == false) && (p.pieceCase != null) ) {
                    for (int j = 0; j < cases.size(); j++) {
                        Case c = cases.get(j);
                        if (canMove(p, p.pieceCase, c)) {
                            movelist = append(movelist, p.pieceCase.name + "." + c.name);
                        }
                    }
                }
            }
            String randomMove = movelist[int(random(movelist.length))];
            addMove(split(randomMove, ".")[0], split(randomMove, ".")[1]);
        }
        reset();
        moveFile();
    }


    public void recursiveMove(int nbmove, String[] gameMove) {
        if (nbmove > 0) {
            for (int i = 0; i < pieces.size(); i++) {
                Piece p = pieces.get(i);
                //if black piece and still on the board
                if ( (p.pieceColor == false) && (p.pieceCase != null) ) {
                    for (int j = 0; j < cases.size(); j++) {
                        Case c = cases.get(j);
                        if (canMove(p, p.pieceCase, c)) {
                            gameMove = addTestMove(p.pieceCase.name, c.name, gameMove);
                            recursiveMove(nbmove-1, gameMove);
                        }
                    }
                }
            }
        } else {
            int score = evaluatePosition(gameMove);
        }
    }
    
    private int evaluatePosition(String[] gameMove) {
        reset();
        moveTestByVar(gameMove);
        return int(random(0,100));
    }

    private String[] addTestMove(String init, String end, String[] gameTestMove) {
        boolean castle = false;
        //if it's a castle move
        if ( (init.equals("e1")) || (init.equals("e8")) ) {
            //all four castle posibility
            if ( ( (init.equals("e1")) && (end.equals("g1")) ) || ( (init.equals("e1")) && (end.equals("c1")) ) || ( (init.equals("e8")) && (end.equals("g8")) ) || ( (init.equals("e8")) && (end.equals("c8")) ) ) {
                castle = true;
            }
        }

        if (!castle) {
            gameTestMove[0] += "|" + init + "." + end;
        } else {
            gameTestMove[0] += "|" + init + "." +"castle" + "." + end;
        }

        return gameTestMove;

        //saveStrings("game.txt", gameMove);
    }

    private void addMove(String init, String end) {
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

        saveStrings("game.txt", gameMove);
    }
}
