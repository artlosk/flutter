import 'package:flutter/material.dart';
import 'package:lesson16/models/user_model.dart';

class NarrowLayout extends StatelessWidget {
  final List<UserModel> users;
  const NarrowLayout({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...users.map((user) {
          return UserItem(user: user);
        }).toList(),
      ],
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
          borderRadius: const BorderRadius.all(
              Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage:
                NetworkImage(user.avatar),
                radius: 40,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 26),
                  ),
                  Text(user.email)
                ],
                crossAxisAlignment:
                CrossAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
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
              ),
            );
          },
        );
        // showPopover(
        //   context: context,
        //   transitionDuration: const Duration(milliseconds: 150),
        //   bodyBuilder: (contextPopover) => ListView(
        //     padding: const EdgeInsets.all(8),
        //     children: const [
        //       ListTile(
        //         title: Text('View profile'),
        //         leading: Icon(Icons.person),
        //       ),
        //       Divider(
        //         thickness: 2,
        //       ),
        //       ListTile(
        //         title: Text('Friends'),
        //         leading: Icon(Icons.group),
        //       ),
        //       Divider(
        //         thickness: 2,
        //       ),
        //       ListTile(
        //         title: Text('Report'),
        //         leading: Icon(Icons.report),
        //       )
        //     ],
        //   ),
        //   //onPop: () => print('Popover was popped!'),
        //   direction: PopoverDirection.bottom,
        //   height: 220,
        // );
      },
    );
  }
}

