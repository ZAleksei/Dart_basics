import 'dart:mirrors';
import 'dart:math';

class delimetersCalculator {
  ///наибольший общий делитель
  int gcd(List<int> arg) {
    Set<int> intersection = {};
    bool first = true;
    int nod = 1;
    for (int i in arg) {
      var fact = Factorization(i);
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
      var fact = Factorization(i.abs());
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

  Set<int> _findDivisor(int arg, bool Condition(a, b), Operation(a, b)) {
    Set<int> res = <int>{};

    for (int i = 1; i <= arg.abs(); i++) {
      if (Condition(arg.abs(), i)) {
        res.add(Operation(arg.abs(), i));
      }
    }
    return res;
  }

  List<int> Factorization(int arg) {
    if (arg==0) {
      throw ArgumentError("аргумент равен нулю");
    }
    arg=arg.abs();
    List<int> res = <int>[];
    int b, c, n;

    while ((arg % 2) == 0) {
      arg ~/= 2;
      res.add(2);
    }
    b = 3;
    c = sqrt(arg).truncate() + 1;
    while (b < c) {
      if ((arg % b) == 0) {
        if (arg / b * b - arg == 0) {
          res.add(b);
          arg ~/= b;
          c = sqrt(arg).truncate() + 1;
        } else
          b += 2;
      } else
        b += 2;
    }
    res.add(arg);
    return res;
  }
}
