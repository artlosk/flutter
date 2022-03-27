import 'package:flutter/material.dart';
import 'package:lesson20_03/data/user.dart';
import 'package:lesson20_03/data/user_secure.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.user, required this.userSecure}) : super(key: key);

  final User user;
  final UserSecure userSecure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.lastname} ${user.firstname}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              user.image,
              fit: BoxFit.contain,
            ),
            Text('Name: ${user.lastname} ${user.firstname}'),
            Text('Age: ${user.age}'),
            Text('Phone: ${user.phone}'),
            Text('Bank card: ${userSecure.card}'),
          ],
        ),
      ),
    );
  }
}
