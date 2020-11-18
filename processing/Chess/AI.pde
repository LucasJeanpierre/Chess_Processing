class AI {
    private int lvl;
    private String Bestmove;

    //private int[] scoreTable = new int[0];
    //private ArrayList<String[]> movelist = new ArrayList<String[]>();

    public AI(int lvl_) {
        lvl=lvl_;
    }


    public void play() {
        reset();
        moveFile();

        //movelist = new String[0][0];

        /*String[] gameMoveAI = loadStrings("game.txt");
         
         gameMoveAI = split(gameMoveAI[0], "|");*/
        //print(gameMove);

        //lvl 0 random move
        //check all of the possible moves
        //and chose one randomly
        //resetMoveList();
        Bestmove = "";
        //call the recursive function who test eveey possible move for the depth chosen
        recursiveMove(profondeur, /*gameMoveAI*/gameMove, false);

        //println("move's number analysed :" + movelist.size());


        String init = split(Bestmove, ".")[0];
        String end = split(Bestmove, ".")[1];

        //println("move : " + init + "." + end);
        addMove(init, end);

        reset();
        moveFile();
    }

    //play move recursivly
    //minimax algorithm
    public float recursiveMove(int nbmove, String[] gameMoveAI, boolean tour) {
        //according to who is playing we want to know which one will be the best 
        //if its white turn they will try to reduce the score
        //so we need to do the move (for depth == 2) with the max score of all the min score of the whites answer moves
        //its minimax algorithm
        float BestScore;
        if (tour) {
            BestScore = 100000;
        } else {
            BestScore = -10000;
        }

        if (nbmove > 0) {
            for (int i = 0; i < pieces.size(); i++) {
                reset();
                moveTestByVar(gameMoveAI);

                Piece p = pieces.get(i);
                //if black piece and still on the board
                if ( (p.pieceColor == tour) && (p.pieceCase != null) ) {
                    for (int j = 0; j < cases.size(); j++) {

                        reset();
                        moveTestByVar(gameMoveAI); 
                        Case c = cases.get(j);

                        //if (canMoveTest(p, p.pieceCase, c, gameMoveAI)) {
                          if (canMove(p, c)) {

                            reset();
                            moveTestByVar(gameMoveAI);

                            //String[] gameMoveTemp = addTestMove(p.pieceCase.name, c.name, gameMoveAI);
                            String[] gameMoveTemp = addTestMove(p, c, gameMoveAI);
                            float score = recursiveMove(nbmove-1, gameMoveTemp, !tour);
                            //float score = 2.1;
                            reset();
                            moveTestByVar(gameMoveAI);

                            //if its all the firts move we keep the String of the move to do it after
                            if (nbmove == profondeur) {

                                //minimax algorithm
                                if (tour) {
                                    if (score < BestScore) {
                                        BestScore = score;
                                        //Bestmove = p.pieceCase.name + "." + c.name;
                                        Bestmove = p.number + "." + c.number;
                                    }
                                } else {
                                    if (score > BestScore) {
                                        BestScore = score;
                                        //Bestmove = p.pieceCase.name + "." + c.name;
                                        Bestmove = p.number + "." + c.number;
                                    }
                                }
                            } else {//if not we just keep the score



                                if (tour) {
                                    BestScore = min(score, BestScore);
                                } else {
                                    BestScore = max(score, BestScore);
                                }
                            }
                        }
                    }
                }
            }
            return BestScore;
        } else {
            //println(evaluatePosition(gameMoveAI)  + join(gameMoveAI, "|") );
            return evaluatePosition(gameMoveAI);
            //String[] scoreString = {join(gameMoveAI, "|"), str(score)};
            //movelist.add(scoreString);
        }
        //println(gameMoveTemp);
    }

    private float evaluatePosition(String[] gameMoveAI) {
        reset();
        //println("reset");
        moveTestByVar(gameMoveAI);
        //println("done");
        if (lvl == 0) {
            return int(random(0, 100));
        } else if (lvl == 1) {
            int score = 0;
            for (int i = 0; i < pieces.size(); i++) {
                Piece p = pieces.get(i);
                if ( (p.pieceCase != null) && (p.pieceColor == false) ) {
                    if (p.type == "queen") {
                        score += 9;
                    } else if (p.type == "rook") {
                        score += 5;
                    } else if (p.type == "knight") {
                        score += 3;
                    } else if (p.type == "bishop") {
                        score += 3;
                    } else if (p.type == "pawn") {
                        score += 1;
                    }
                } else if ( (p.pieceCase != null) && (p.pieceColor == true) ) {
                    if (p.type == "queen") {
                        score -= 9;
                    } else if (p.type == "rook") {
                        score -= 5;
                    } else if (p.type == "knight") {
                        score -= 3;
                    } else if (p.type == "bishop") {
                        score -= 3;
                    } else if (p.type == "pawn") {
                        score -= 1;
                    }
                }
            }

            //their is a bug when isKingCheck and/or isCheckMate are live
            /*if (isKingCheck(true)) {
             score += 10;
             }*/

            /*if (isCheckMate()) {
             if (isKingCheck(true)) {
             score += 100;
             }
             }*/
            return score + random(1)*0.2;
        } else {
            return 0;
        }
    }

    private String[] addTestMove_old(String init, String end, String[] gameTestMove) {
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
            gameTestMove = append(gameTestMove, init + "." + end);
        } else {
            //gameTestMove[0] += "|" + init + "." +"castle" + "." + end;
            gameTestMove = append(gameTestMove, init + "." +"castle" + "." + end);
        }

        return gameTestMove;
    }

    private String[] addTestMove(Piece p, Case c, String[] gameTestMove) {
        boolean castle = false;
        //if it's a castle move
        if ( (p.pieceCase.name.equals("e1")) || (p.pieceCase.name.equals("e8")) ) {
            //all four castle posibility
            if ( ( (p.pieceCase.name.equals("e1")) && (c.name.equals("g1")) ) || ( (p.pieceCase.name.equals("e1")) && (c.name.equals("c1")) ) || ( (p.pieceCase.name.equals("e8")) && (c.name.equals("g8")) ) || ( (p.pieceCase.name.equals("e8")) && (c.name.equals("c8")) ) ) {
                if (p.type == "king") {
                    castle = true;
                }
            }
        }

        if (!castle) {
            //gameTestMove[0] += "|" + init + "." + end;
            if (c.asPieceOn) {
                gameTestMove = append(gameTestMove, p.number + "." + c.number + "." + pieces.get(getPieceByCase(c)));
            } else {
                gameTestMove = append(gameTestMove, p.number + "." + c.number);
            }
        } else {
            //gameTestMove[0] += "|" + init + "." +"castle" + "." + end;
            gameTestMove = append(gameTestMove, p.number + "." +"castle" + "." + c.number);
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

        //String[] gameMove = loadStrings("game.txt");

        if (!castle) {
            //gameMove[0] += "|" + init + "." + end;
            gameMove = append(gameMove, init + "." + end);
        } else {
            //gameMove[0] += "|" + init + "." +"castle" + "." + end;
            gameMove = append(gameMove, init + "." + "castle" +"."+ end);
        }

        saveStrings("game.txt", gameMove);
    }

    /*private void resetMoveList() {
     for (int i = movelist.size() - 1; i >= 0; i--) {
     movelist.remove(i);
     }
     }*/
}
