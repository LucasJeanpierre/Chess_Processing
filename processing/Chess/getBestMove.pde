//minimax algo
//only work for depth = 2
public int getBestMove(ArrayList<String[]> movelist) {
    for (int i = 0; i < movelist.size(); i++) {
        //println(movelist.get(i));
    }
    //print("mylength = " + mylength);


    String currentMove = "";

    //get table zone where the previous move is the same
    for (int i = 0; i < movelist.size(); i++) {
        String move = split(movelist.get(i)[0], "|")[nbMoves+1];
        //println("move : "+move);
        //println("current : "+currentMove);
        if (!move.equals(currentMove)) {
            currentMove = move;
            println(move);
            minimax(movelist.get(i), nbMoves+1);
        }
    }


    return 0;
}

public void minimax(String move, int nb) {
    if (nb)
}



public int getMin(Integer[] list) {
    int min = 1000000000;
    for (int i = 0; i < list.length; i++) {
        if  (list[i] < min) {
            min = list[i];
        }
    }
    return min;
}

public int getMax(Integer[] list) {
    int max = -10000000;
    for (int i = 0; i < list.length; i++) {
        if  (list[i] > max) {
            max = list[i];
        }
    }
    return max;
}


public boolean hasValue(String[] liste, String element) {
    for (int i = 0; i < liste.length; i++) {
        if (liste[i].equals(element)) {
            return true;
        }
    }
    return false;
}
