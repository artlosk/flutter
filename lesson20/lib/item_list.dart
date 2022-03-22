import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key, required this.list, required this.tab}) : super(key: key);

  final List list;
  final int tab;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    var tmpList = widget.list;
    if (widget.tab == 1) {
      tmpList = tmpList.where((element) => element.status == 1).toList();
    }
    return ListView(
      children: [
        ...tmpList.map((user) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius:
              const BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          height: 150,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 100, height: 100, child: Image.asset('assets/images/${user.image}', fit: BoxFit.contain,)),
                              Text('${user.firstname} ${user.lastname}'),
                              Text(
                                user.email,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black38),
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ActionChip(
                          label: Text(
                            user.status == 1
                                ? 'Активист'
                                : 'Не определен',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: user.status == 1
                              ? const Color(0xFF4db6ac)
                              : const Color(0xFFff8a65),
                          elevation: 6.0,
                          // shadowColor: Colors.grey[60],
                          padding: const EdgeInsets.all(6.0),
                          onPressed: () {
                            var index = widget.list.indexWhere((element) => element == user);
                            setState(() {
                              if (user.status == 1) {
                                user = user.copyWith(id: user.id, firstname: user.firstname, lastname: user.lastname, email: user.email, image: user.image, status: 0);
                              } else {
                                user = user.copyWith(id: user.id, firstname: user.firstname, lastname: user.lastname, email: user.email, image: user.image, status: 1);
                              }
                              widget.list[index] = user;
                            });
                          },

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        }).toList(),
      ],
    );
  }
}
