public void showAvailableCases() {
    fill(255,0,0);
    for (int i = 0; i < availableCases.size(); i++) {
        PVector vec = availableCases.get(i);
        ellipse(vec.x, vec.y, caseSize/4, caseSize/4);
    }
}