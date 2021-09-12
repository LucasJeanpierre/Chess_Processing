public int getCaseByXY(int x_, int y_) {
  /*print(x_, ' ', y_, ' ');
   for (int i = 0; i < cases.size(); i++) {
   Case c = cases.get(i);
   if (c.getX() == x_ && c.getY() == y_) {
   println(i);
   return i;
   }
   }
   return -1;*/

  int result = x_+y_*8;
  return result;
}
