class User {
  String? email;
  String name = "без имени";
  User(this.name);
}

mixin MailSystem on User {
  String? getMailSystem() {
    List<String>? ea = email?.split("@");
    return ea?.last;
  }
}

class AdminUser extends User with MailSystem {
  AdminUser(name) : super(name);
}

class GeneralUser extends User {
  GeneralUser(name) : super(name);
}

class UserManager<T extends User> {
  final List<T> listUsers = [];

  void add(T user) {
    listUsers.add(user);
  }

  bool remove(T user) {
    return listUsers.remove(user);
  }

  void printAllUsers() {
    print("*********************************************");
    print("Количество пользователей ${listUsers.length} ");
    listUsers.forEach((element) {
      if (element is AdminUser) {
        print("Пользоваетель ${element.name} Admin ${element.getMailSystem()}");
      } else {
        print("Пользоваетель ${element.name}  почта ${element.email}");
      }
    });
  }
}
