import 'package:flutter/material.dart';
import 'package:lesson16/models/user_model.dart';
import 'package:popover_gtk/popover_gtk.dart';

class WideLayout extends StatelessWidget {
  final List<UserModel> users;

  const WideLayout({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: users.length,
      itemBuilder: (contextGrid, index) {
        return UserItem(user: users[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: MediaQuery.of(context).size.width > 1000 ? 2 : 1.7,
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final UserModel user;
  const UserItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
                radius: MediaQuery.of(context).size.width / 30,
              ),
            ),
            Text(
              user.name,
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.02),
            ),
            Text(user.email),
          ],
        ),
      ),
      onTap: () {
        showPopover(
          context: context,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (contextPopover) => ListView(
            padding: const EdgeInsets.all(8),
            children: const [
              ListTile(
                title: Text('View profile'),
                leading: Icon(Icons.person),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: Text('Friends'),
                leading: Icon(Icons.group),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: Text('Report'),
                leading: Icon(Icons.report),
              )
            ],
          ),
          //onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
          height: 200,
        );
      },
    );
  }
}

