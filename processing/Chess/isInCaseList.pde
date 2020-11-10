public boolean isInCaseList(Case c, ArrayList<Case> cases_list) {
    for (int i = 0; i < cases_list.size(); i++) {
        Case c_ = cases_list.get(i);
        if (c == c_) {
            return true;
        }
    }
    return false;
}
