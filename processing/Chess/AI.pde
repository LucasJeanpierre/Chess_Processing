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
        boolean played = false;
        //lvl 0 random move
        while (!played) {
            if (lvl == 0) {
                int ipiece = int(random(pieces.size()));
                if ( (pieces.get(ipiece).pieceColor == false) && (pieces.get(ipiece).pieceCase != null) ) {
                    int icase = int(random(cases.size()));
                    if (canMove(pieces.get(ipiece),pieces.get(ipiece).pieceCase,cases.get(icase))) {
                        addMove(pieces.get(ipiece).pieceCase.name,cases.get(icase).name);
                        played = true;
                    }
                }
            }
        }
        reset();
        moveFile();
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
