class Convertor {

  static int binToDec(String str) {
    int res = 0;
    int m = 1;
    str=str.replaceAll(" ", "");
    for (int i = str.length - 1; i >= 0; i--) {
      String b = str[i];
     // print(" $b $res $m");
      switch (b) {
        case "0":
          break;
        case "1":
          res +=m;
          break;
        default:
          throw ArgumentError("значение не бинарное");
      }
      m *=2;

    }
    return res;
  }
  static String DecToBin(int number){
   if(number<0){
     throw ArgumentError("значение меньше нуля");
   }

    String res = "";
    do
    {
      if ( (number & 1) == 0 )
        res = "0"+res;
      else
        res = "1"+res;
      number >>= 1;
    } while ( number!=0 );

    return res;

  }
}