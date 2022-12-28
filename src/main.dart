import '../lib/users.dart';
import '../lib/convertor.dart';
import '../lib/main_math.dart';
import '../lib/delimeters_calculator.dart';
import '../lib/worlds.dart';
import '../lib/points.dart';

main() {
  //#region    Задание 1
  print("\n Задание 1 ********************************************");
  var dc = DelimetersCalculator();

  print(dc.gcd([18, 6, -27]));
  print(dc.lcm([84, 6, 48, 7, 143]));
  int f = -15;
  print("Для числа ${f} простые множители ${dc.factorization(f)}");
  //#endregion Задание 1
  //#region    Задание 2
  print("\n Задание 2 ********************************************");
  int dec = 255;
  print("Десятичное $dec  в двоичное ${Convertor.decToBin(dec)} ");
  dec = 128;
  print("Десятичное $dec  в двоичное ${Convertor.decToBin(dec)} ");
  String str = "1000 0001";
  print("\nДвоичное $str  в десятичное ${Convertor.binToDec(str)} ");
  str = "0000 1000";
  print("Двоичное $str  в десятичное ${Convertor.binToDec(str)} ");
  //#endregion Задание 2

  //#region    Задание 3
  print("\n Задание 3 ********************************************");
  var w = Worlds();
  var strText = "3, полученный массив содержит 3 элемента 4 6 4";
  print(
      "В строке \"$strText\" найти цифры, разделитель пробел ${w.findNum(strText)} ");

  //#endregion Задание 3

  //#region    Задание 4
  print("\n Задание 4 ********************************************");
  strText = "12 12  12 полученный 12 содержит элемент элемента 4 элемент ";
  print("В строке \"$strText\"\n статистика слов ${w.statistics(strText)} ");

  //#endregion Задание 4

  //#region    Задание 5
  print("\n Задание 5 ********************************************");
  strText = "one, two, three, cat, dog, one";
  print(
      "В строке \"$strText\"\n уникальные цифры ${w.findNumString(strText)} ");
  //#endregion Задание 5

  //#region    Задание 6
  print("\n Задание 6 ********************************************");

  Point a = Point(10, 20, 30);
  Point b = Point(-10, -20, -30);
  Point c = Point.one();

  print("Дистанция между a ${a} и b${b}  равно ${a.distanceTo(b)} ");
  print(
      "Площадь треугольнтка a,b,c ${a},${b},${c}  равно ${Point.areaOfTriangle(a, b, c)} ");

  a = Point.zero();
  b = Point.one();

  print("Дистанция между a ${a} и b${b}  равно ${a.distanceTo(b)} ");
  a = Point.one();
  b = Point.one();
  c = Point(1, 1, 1);

  print("Объекты  a ${a}  и b${b}  равны ${a == b} ");
  print("Объекты  a ${a}  и c${c}  равны ${a == c} ");

  //#endregion Задание 6

  //#region    Задание 7
  print("\n Задание 7 ********************************************");
  num n = 27;
  num pow = 3;
  print("Корень степени $pow из числа  $n = ${n.mainRoot(pow)}  ");

  try {
    n = 9;
    pow = 0;
    print("Корень степени $pow из числа  $n = ${n.mainRoot(pow)}  ");
  } on ArgumentError catch (e) {
    print('Exception $e');
  } catch (e) {
    rethrow;
  }

  try {
    n = 9;
    pow = -2;
    print("Корень степени $pow из числа  $n = ${n.mainRoot(pow)}  ");
  } on ArgumentError catch (e) {
    print('Exception $e');
  } catch (e) {
    rethrow;
  }

  //#endregion Задание 7

// #region Задание 8
  print("\n Задание 8");
  UserManager<User> users = UserManager();
  final User u1 = User("u1")..email = "u1@mail.ru";
  users.add(u1);
  users.printAllUsers();

  final User u2 = User("u2")..email = "u2@mail.ru";
  users.add(u2);
  users.printAllUsers();

  final User u3 = AdminUser("u3")..email = "u3@gmail.com";
  users.add(u3);
  users.printAllUsers();

  final User u4 = GeneralUser("u4");
  // ..email="u4@mail.ru";
  users.add(u4);
  users.printAllUsers();

  users.remove(u2);
  users.printAllUsers();

//#endregion Задание 8
}
