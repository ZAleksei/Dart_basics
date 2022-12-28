import 'dart:math';

class DelimetersCalculator {
  ///наибольший общий делитель
  int gcd(List<int> arg) {
    Set<int> intersection = {};
    bool first = true;
    int nod = 1;
    for (int i in arg) {
      var fact = factorization(i.abs());
      if (first) {
        first = false;
        intersection.addAll(fact);
      } else {
        Set<int> tmp = {};
        tmp.addAll(fact);
        intersection = intersection.intersection(tmp);
      }
      print(
          "   Для числа ${i}   простые множители ${fact}  пересечение ${intersection} ");
    }
    intersection.forEach((element) => nod *= element);
    print("НОД ${nod} для ${arg}");
    return nod;
  }

  ///наименьшее общее кратное
  // Наименьшее общее кратное нескольких чисел равно произведению,
  // которое составляется так: ко всем множителям из разложения первого числа
  // добавляются недостающие множители из разложения второго числа, к полученным
  // множителям добавляются недостающие множители из разложения третьего числа
  // и так далее.
  int lcm(List<int> arg) {
    List<int> listFactor = [];
    bool first = true;
    int nok = 1;
    for (int i in arg) {
      var fact = factorization(i.abs());
      if (first) {
        first = false;
        listFactor.addAll(fact);
      } else {
        listFactor.forEach((element) => fact.remove(element));
        listFactor.addAll(fact);
      }
      print(
          "   Для числа ${i}   уникальные простые множители ${fact} дополненные множетели${listFactor} ");
    }
    listFactor.forEach((element) => nok *= element);
    print("НОК ${nok} для ${arg}");
    return nok;
  }



  List<int> factorization(int arg) {
    if (arg == 0) {
      throw ArgumentError("аргумент равен нулю");
    }
    int argAbs = arg.abs();
    List<int> res = <int>[];
    int b, c;

    while ((argAbs % 2) == 0) {
      argAbs ~/= 2;
      res.add(2);
    }
    b = 3;
    c = sqrt(argAbs).truncate() + 1;
    while (b < c) {
      if ((argAbs % b) == 0) {
        if (argAbs / b * b - argAbs == 0) {
          res.add(b);
          argAbs ~/= b;
          c = sqrt(argAbs).truncate() + 1;
        } else
          b += 2;
      } else
        b += 2;
    }
    res.add(argAbs);
    if (arg < 0) {
      res[0] = -res[0];
    }
    return res;
  }
}
