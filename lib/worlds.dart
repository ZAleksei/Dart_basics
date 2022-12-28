class Worlds {
  ///вернуть числа из строки
  List<num> findNum(String str) {
    List<num> res = [];
    List<String> list = str.split(" ");
    for (String s in list) {
      var value = num.tryParse(s);
      if (value != null) {
        res.add(value);
      }
    }
    return res;
  }

  ///вернуть статистику употребления слов
  Map<String, int> statistics(String str) {
    Map<String, int> res = {};
    List<String> list = str.split(" ");
    for (String s in list) {
      s = s.trim();
      if (s == "") continue;
      var value = res[s];
      if (value == null) {
        res[s] = 1;
      } else {
        res[s] = ++value;
      }
    }
    return res;
  }

  Set<int> findNumString(String str) {
    const List<String> listKey = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];
    Set<int> res = {};
    List<String> list = str.split(",");
    for (String s in list) {
      var value = listKey.indexOf(s.trim());
      if (value >= 0) {
        res.add(value);
      }
    }
    return res;
  }
}
