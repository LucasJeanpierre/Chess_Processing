public int getCaseByXY(int x_, int y_) {
    for (int i = 0; i < cases.size(); i++) {
        Case c = cases.get(i);
        if (c.getX() == x_ && c.getY() == y_) {
            return i;
        }
    }
    return -1;
}
