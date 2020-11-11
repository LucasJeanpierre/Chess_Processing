public int getCaseByName(String caseName) {
    for (int i = 0; i < cases.size(); i++) {
        Case c = cases.get(i);
        if (caseName.equals(c.name)) {
            return i;
        }
    }
    return -1;
}
