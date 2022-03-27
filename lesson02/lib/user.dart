class User
{
   final String email;
   User(this.email);

   String getMailSystem()
   {
     return email;
   }
}

mixin UserMixin on User
{
  String getMailSystem()
  {
    List? list = email.split('@');
    if (list.length == 2) {
      return list[1];
    }
    return '';
  }
}

class AdminUser extends User with UserMixin
{
  AdminUser(String email) : super(email);
}

class GeneralUser extends User
{
  GeneralUser(String email): super(email);
}

class UserManager <T extends User>
{
  Map<dynamic, dynamic> list = {};

  void addUser(int id, String role, String email)
  {
    try {
      list.forEach((key, value) {
        value.forEach((key1, value1) {
          if (key1 == 'id' && value1 == id || key1 == 'email' && value1 == email) {
            throw ArgumentError('ID or Email already exists');
          }
        });
      });

      Map<dynamic, dynamic>newList = {"id": id, "role": role, "email": email};
      list.putIfAbsent(list.length, () => newList);
    } catch (e) {
      print(e);
    }
  }

  void removeUserById(int id)
  {
    list.removeWhere((key, value) => list[key]['id'] == id);
  }

  Map listUser()
  {
    for(var i = 0; i < list.length; i++) {
      list[i].forEach((key, value) {
        if (key == 'role' && value == 'admin') {
          List? newEmail = list[i]['email'].split('@');
          if (newEmail != null && newEmail.length == 2) {
            list[i]['email'] = newEmail[1];
          }
        }
      });
    }
    return this.list;
  }

}