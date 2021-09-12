/**
 * Place piece on the board accordgin the the fen String
 *
 *
 */

public void fenPlace(String fen) {
    String fenLetter;
    int x=0; 
    int y=0;
    String[] table_fen = split(fen, "/");
    for (int i = 0; i < table_fen.length; i++) {
        for (int j = 0; j < table_fen[i].length(); j++) {
            fenLetter = str(table_fen[i].charAt(j));
            //if is a number
            print(fenLetter, ' ');
            if (matchAll(fenLetter, "^[0-9]$") != null) {
                //print(int(fenLetter));
                x += int(fenLetter);
            } else {
                //is the letter lowercase
                if (fenLetter.toLowerCase().equals(fenLetter)) {
                    pieces.add(new King(fenLetterToPieceName(str(table_fen[i].charAt(j))), false, cases.get(getCaseByXY(x,y))));
                } else {
                    pieces.add(new King(fenLetterToPieceName(str(table_fen[i].charAt(j))), true, cases.get(getCaseByXY(x,y))));
                }
                x+=1;
            }
        }
        y += 1;
        x = 0;
    }
}


public String fenLetterToPieceName(String fenLetter) {
    switch(fenLetter.toLowerCase()) {
        case "r" :
            return "rook";
        case "n":
            return "knight";
        case "b":
            return "bishop";
        case "q":
            return "queen";
        case "k":
            return "king";
        case "p":
            return "pawn";
        default :
            return "";
    }
}
