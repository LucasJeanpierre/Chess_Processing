public ArrayList<Case> movableCaseForPiece(Piece p) {
    ArrayList<Case> cases_list = new ArrayList<Case>();
    if (p.type == "pawn") {
        //test for all cases
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            //is this is not the case where the piece is already
            if (p.pieceCase != c) {
                //if white piece
                if (p.pieceColor == true) {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if the piece is in diagonal to the pawn
                            if ( (p.pieceCase.x == c.x + 1 ) || (p.pieceCase.x == c.x - 1) ) {
                                if (p.pieceCase.y == c.y + 1 ) {
                                    cases_list.add(c);
                                }
                            }
                        }
                    } else { //if there is no piece on the case
                        //if the case is in the same line as the piece
                        if (p.pieceCase.x == c.x) {
                            //if the case is the case in front of the pawn
                            if (p.pieceCase.y == c.y + 1) { 
                                cases_list.add(c);
                            } else if ( (p.pieceCase.y == c.y + 2 ) && (p.nbmove == 0) ) { //if this is the first move of the pawn and the case is 2 case forward
                                //if their no piece between the case and the piece
                                if (!cases.get(getCaseByXY(c.x, c.y+1)).asPieceOn()) {
                                    cases_list.add(c);
                                }
                            }
                        }
                    }
                } else {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if the piece is in diagonal to the pawn
                            if ( (p.pieceCase.x == c.x + 1 ) || (p.pieceCase.x == c.x - 1) ) {
                                if (p.pieceCase.y == c.y - 1 ) {
                                    cases_list.add(c);
                                }
                            }
                        }
                    } else { //if there is no piece on the case
                        //if the case is in the same line as the piece
                        if (p.pieceCase.x == c.x) {
                            //if the case is the case in front of the pawn
                            if (p.pieceCase.y == c.y - 1) { 
                                cases_list.add(c);
                            } else if ( (p.pieceCase.y == c.y - 2 ) && (p.nbmove == 0) ) { //if this is the first move of the pawn and the case is 2 case forward
                                //if their no piece between the case and the piece
                                if (!cases.get(getCaseByXY(c.x, c.y-1)).asPieceOn()) {
                                    cases_list.add(c);
                                }
                            }
                        }
                    }
                }
            }
        }
    } else if (p.type == "rook") {//if is a rook
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            //not the case who the piece is already
            if (p.pieceCase != c) {
                //if on the same colmun
                if (p.pieceCase.x == c.x) {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if their is any other pieces between the case and the piece
                            //delta is the direction in the board to go from the case to the piece
                            int delta = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                            boolean noPiece = true;
                            for (int position = c.y + delta; position != p.pieceCase.y; position+=delta) {
                                Case case_ = cases.get(getCaseByXY(c.x, position));
                                //if their is a piece on we can't move here so noPiece = false and the case is not valid
                                if (case_.asPieceOn()) {
                                    noPiece = false;
                                }
                            }
                            //if no piece between the case and the piece it's ok
                            if (noPiece) {
                                cases_list.add(c);
                            }
                        }
                    } else {
                        //if their is any other pieces between the case and the piece
                        //delta is the direction in the board to go from the case to the piece
                        int delta = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                        boolean noPiece = true;
                        for (int position = c.y + delta; position != p.pieceCase.y; position+=delta) {
                            Case case_ = cases.get(getCaseByXY(c.x, position));
                            //if their is a piece on we can't move here so noPiece = false and the case is not valid
                            if (case_.asPieceOn()) {
                                noPiece = false;
                            }
                        }
                        //if no piece between the case and the piece it's ok
                        if (noPiece) {
                            cases_list.add(c);
                        }
                    }
                } else if (p.pieceCase.y == c.y) { //if on the same line
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if their is any other pieces between the case and the piece
                            //delta is the direction in the board to go from the case to the piece
                            int delta = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                            boolean noPiece = true;
                            for (int position = c.x + delta; position != p.pieceCase.x; position+=delta) {
                                Case case_ = cases.get(getCaseByXY(position, c.y));
                                //if their is a piece on we can't move here so noPiece = false and the case is not valid
                                if (case_.asPieceOn()) {
                                    noPiece = false;
                                }
                            }
                            //if no piece between the case and the piece it's ok
                            if (noPiece) {
                                cases_list.add(c);
                            }
                        }
                    } else {
                        //if their is any other pieces between the case and the piece
                        //delta is the direction in the board to go from the case to the piece
                        int delta = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                        boolean noPiece = true;
                        for (int position = c.x + delta; position != p.pieceCase.x; position+=delta) {
                            Case case_ = cases.get(getCaseByXY(position, c.y));
                            //if their is a piece on we can't move here so noPiece = false and the case is not valid
                            if (case_.asPieceOn()) {
                                noPiece = false;
                            }
                        }
                        //if no piece between the case and the piece it's ok
                        if (noPiece) {
                            cases_list.add(c);
                        }
                    }
                }
            }
        }
    } else if (p.type == "bishop") {
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            //not the case who the piece is already
            if (p.pieceCase != c) {
                //if on the same diagonal
                if ( abs(p.pieceCase.x - c.x) == abs(p.pieceCase.y - c.y) ) {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //delta represent the unity of distance between the case and the piece
                            //we check if their no other pieces between the piece and the case
                            int deltax = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                            int deltay = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                            boolean noPiece = true;

                            int positionx = c.x + deltax;
                            int positiony = c.y + deltay;

                            while ( (positionx != p.pieceCase.x) && (positiony != p.pieceCase.y) ) {
                                Case c_ = cases.get(getCaseByXY(positionx, positiony));
                                //if their is a piece on we can't move here so noPiece = false and the case is not valid
                                if (c_.asPieceOn()) {
                                    noPiece = false;
                                }
                                positionx += deltax;
                                positiony += deltay;
                            }

                            //if no piece between the case and the piece it's ok
                            if (noPiece) {
                                cases_list.add(c);
                            }
                        }
                    } else {
                        //delta represent the unity of distance between the case and the piece
                        //we check if their no other pieces between the piece and the case
                        int deltax = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                        int deltay = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                        boolean noPiece = true;

                        int positionx = c.x;
                        int positiony = c.y;

                        while ( (positionx != p.pieceCase.x) && (positiony != p.pieceCase.y) ) {
                            Case c_ = cases.get(getCaseByXY(positionx, positiony));
                            if (c_.asPieceOn()) {
                                noPiece = false;
                            }

                            positionx += deltax;
                            positiony += deltay;
                        }

                        if (noPiece) {
                            cases_list.add(c);
                        }
                    }
                }
            }
        }
    } else if (p.type == "knight") {
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            //not the case who the piece is already
            if (p.pieceCase != c) {
                //if is on the kinght move 2 in a direction a 1 on the other
                if ( (abs(p.pieceCase.x - c.x) == 2) || (abs(p.pieceCase.x - c.x) == 1) ) {
                    if ( (abs(p.pieceCase.y - c.y) == 2) || (abs(p.pieceCase.y - c.y) == 1) ) {
                        if ( abs(p.pieceCase.x - c.x) != abs(p.pieceCase.y - c.y) ) {
                            //if a piece is on this case
                            if (c.asPieceOn()) {
                                //if the piece on the case is not the same color as the current piece
                                if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                                    cases_list.add(c);
                                }
                            } else {//if their no piece on the case
                                cases_list.add(c);
                            }
                        }
                    }
                }
            }
        }
    } else if (p.type == "queen") {
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            //not the case who the piece is already
            if (p.pieceCase != c) {
                //if on the same colmun
                if (p.pieceCase.x == c.x) {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if their is any other pieces between the case and the piece
                            //delta is the direction in the board to go from the case to the piece
                            int delta = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                            boolean noPiece = true;
                            for (int position = c.y + delta; position != p.pieceCase.y; position+=delta) {
                                Case case_ = cases.get(getCaseByXY(c.x, position));
                                //if their is a piece on we can't move here so noPiece = false and the case is not valid
                                if (case_.asPieceOn()) {
                                    noPiece = false;
                                }
                            }
                            //if no piece between the case and the piece it's ok
                            if (noPiece) {
                                cases_list.add(c);
                            }
                        }
                    } else {
                        //if their is any other pieces between the case and the piece
                        //delta is the direction in the board to go from the case to the piece
                        int delta = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                        boolean noPiece = true;
                        for (int position = c.y + delta; position != p.pieceCase.y; position+=delta) {
                            Case case_ = cases.get(getCaseByXY(c.x, position));
                            //if their is a piece on we can't move here so noPiece = false and the case is not valid
                            if (case_.asPieceOn()) {
                                noPiece = false;
                            }
                        }
                        //if no piece between the case and the piece it's ok
                        if (noPiece) {
                            cases_list.add(c);
                        }
                    }
                } else if (p.pieceCase.y == c.y) { //if on the same line
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //if their is any other pieces between the case and the piece
                            //delta is the direction in the board to go from the case to the piece
                            int delta = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                            boolean noPiece = true;
                            for (int position = c.x + delta; position != p.pieceCase.x; position+=delta) {
                                Case case_ = cases.get(getCaseByXY(position, c.y));
                                //if their is a piece on we can't move here so noPiece = false and the case is not valid
                                if (case_.asPieceOn()) {
                                    noPiece = false;
                                }
                            }
                            //if no piece between the case and the piece it's ok
                            if (noPiece) {
                                cases_list.add(c);
                            }
                        }
                    } else {
                        //if their is any other pieces between the case and the piece
                        //delta is the direction in the board to go from the case to the piece
                        int delta = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                        boolean noPiece = true;
                        for (int position = c.x + delta; position != p.pieceCase.x; position+=delta) {
                            Case case_ = cases.get(getCaseByXY(position, c.y));
                            //if their is a piece on we can't move here so noPiece = false and the case is not valid
                            if (case_.asPieceOn()) {
                                noPiece = false;
                            }
                        }
                        //if no piece between the case and the piece it's ok
                        if (noPiece) {
                            cases_list.add(c);
                        }
                    }
                }  

                //if on the same diagonal
                if ( abs(p.pieceCase.x - c.x) == abs(p.pieceCase.y - c.y) ) {
                    //if a piece is on this case
                    if (c.asPieceOn()) {
                        //if the piece on the case is not the same color as the current piece
                        if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                            //delta represent the unity of distance between the case and the piece
                            //we check if their no other pieces between the piece and the case
                            int deltax = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                            int deltay = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                            boolean noPiece = true;

                            int positionx = c.x + deltax;
                            int positiony = c.y + deltay;

                            while ( (positionx != p.pieceCase.x) && (positiony != p.pieceCase.y) ) {
                                Case c_ = cases.get(getCaseByXY(positionx, positiony));
                                //if their is a piece on we can't move here so noPiece = false and the case is not valid
                                if (c_.asPieceOn()) {
                                    noPiece = false;
                                }
                                positionx += deltax;
                                positiony += deltay;
                            }

                            //if no piece between the case and the piece it's ok
                            if (noPiece) {
                                cases_list.add(c);
                            }
                        }
                    } else {
                        //delta represent the unity of distance between the case and the piece
                        //we check if their no other pieces between the piece and the case
                        int deltax = (p.pieceCase.x - c.x) / abs(p.pieceCase.x - c.x);
                        int deltay = (p.pieceCase.y - c.y) / abs(p.pieceCase.y - c.y);
                        boolean noPiece = true;

                        int positionx = c.x;
                        int positiony = c.y;

                        while ( (positionx != p.pieceCase.x) && (positiony != p.pieceCase.y) ) {
                            Case c_ = cases.get(getCaseByXY(positionx, positiony));
                            if (c_.asPieceOn()) {
                                noPiece = false;
                            }

                            positionx += deltax;
                            positiony += deltay;
                        }

                        if (noPiece) {
                            cases_list.add(c);
                        }
                    }
                }
            }
        }
    } else if (p.type == "king") {
        King king = (King) p;
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            //not the case who the piece is already
            if (p.pieceCase != c) {
                //if as piece on
                if (c.asPieceOn()) {
                    //if the piece on the case is not the same color as the current piece
                    //basic move for the king
                    if (pieces.get(getPieceByCase(c)).pieceColor != p.pieceColor) {
                        if ( ( ( (abs(p.pieceCase.x - c.x) == 0) || (abs(p.pieceCase.x - c.x) == 1) ) ) && ( ( (abs(p.pieceCase.y - c.y) == 0) || (abs(p.pieceCase.y - c.y) == 1) ) ) ) {
                            cases_list.add(c);
                        }
                    }

                } else {
                    //basic king move
                    if ( ( ( (abs(p.pieceCase.x - c.x) == 0) || (abs(p.pieceCase.x - c.x) == 1) ) ) && ( ( (abs(p.pieceCase.y - c.y) == 0) || (abs(p.pieceCase.y - c.y) == 1) ) ) ) {
                        cases_list.add(c);
                    } else if (king.wasCheck == false){
                        //castle
                        //if in the same line and 2 cases on left or right
                        if ( (p.nbmove == 0) && (abs(p.pieceCase.x - c.x) == 2) && (p.pieceCase.y == c.y) ){
                            //if white king
                            if (p.pieceColor == true) {
                                //if white caslte with the h1 rook
                                if ((p.pieceCase.x - c.x) < 0) {
                                    //if the rook is still here and no piece between king and rook
                                    if ( (cases.get(63).asPieceOn) && (cases.get(61).asPieceOn == false) ){
                                        //get the rook
                                        Piece rook = pieces.get(getPieceByCase(cases.get(63)));
                                        //if rook never moved
                                        if (rook.nbmove == 0) {
                                            //if the king is not check
                                            //is isCaseCheck and not isKingcCheck to avoid infinit recursive loop
                                            //if we use isKingCheck the other king will check if he can go here and to do that he will will check if the this king can go here and to do that... 
                                            if (!isCaseCheck(pieces.get(0).pieceCase,true)) {//if (!isKingCheck(true)) {
                                                //if any of the cases between the king and the rook are threaten by opponent pieces
                                                if ( (!isCaseCheck(cases.get(61), true)) && (!isCaseCheck(cases.get(62), true)) )
                                                {
                                                    cases_list.add(c);
                                                }
                                            }
                                        }
                                    }
                                } else {//if white caslte with the a1 rook
                                    //if the rook is still here and no piece between king and rook
                                    if ( (cases.get(56).asPieceOn) && (cases.get(59).asPieceOn == false) && (cases.get(57).asPieceOn == false) ){
                                        //get the rook
                                        Piece rook = pieces.get(getPieceByCase(cases.get(56)));
                                        //if rook never moved
                                        if (rook.nbmove == 0) {
                                            //if the king is not check
                                            if (!isCaseCheck(pieces.get(0).pieceCase,true)) { //if (!isKingCheck(true)) {
                                                //if any of the cases between the king and the rook are threaten by opponent pieces
                                                if ( (!isCaseCheck(cases.get(57), true)) && (!isCaseCheck(cases.get(58), true)) && (!isCaseCheck(cases.get(59), true)) )
                                                {
                                                    cases_list.add(c);
                                                }
                                            }
                                        }
                                    }
                                }
                            }else if (p.pieceColor==false) {//if black king
                                //if black caslte with the h8 rook
                                if ((p.pieceCase.x - c.x) < 0) {
                                    //if the rook is still here and no piece between king and rook
                                    if ( (cases.get(7).asPieceOn) && (cases.get(5).asPieceOn == false) ){
                                        //get the rook
                                        Piece rook = pieces.get(getPieceByCase(cases.get(7)));
                                        //if rook never moved
                                        if (rook.nbmove == 0) {
                                            //if the king is not check
                                            if (!isCaseCheck(pieces.get(1).pieceCase,false)) {//if (!isKingCheck(false)) {
                                                //if any of the cases between the king and the rook are threaten by opponent pieces
                                                if ( (!isCaseCheck(cases.get(5), false)) && (!isCaseCheck(cases.get(6), false)) )
                                                {
                                                    cases_list.add(c);
                                                }
                                            }
                                        }
                                    }
                                } else {//if black caslte with the a8 rook
                                    //if the rook is still here and no piece between king and rook
                                    if ( (cases.get(0).asPieceOn) && (cases.get(1).asPieceOn == false) && (cases.get(3).asPieceOn == false) ){
                                        //get the rook
                                        Piece rook = pieces.get(getPieceByCase(cases.get(0)));
                                        //if rook never moved
                                        if (rook.nbmove == 0) {
                                            //if the king is not check
                                            if (!isCaseCheck(pieces.get(1).pieceCase,false)) { //if (!isKingCheck(false)) {
                                                //if any of the cases between the king and the rook are threaten by opponent pieces
                                                if ( (!isCaseCheck(cases.get(1), false)) && (!isCaseCheck(cases.get(2), false)) && (!isCaseCheck(cases.get(3), false)) )
                                                {
                                                    cases_list.add(c);
                                                }
                                            }
                                        }
                                    }
                                }
                            }      
                        }
                    }
                }
            }
        }
    }

    return cases_list;
}
