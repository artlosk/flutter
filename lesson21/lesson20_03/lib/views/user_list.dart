import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lesson20_03/data/app_database.dart';
import 'package:lesson20_03/data/user.dart';
import 'package:lesson20_03/data/user_secure.dart';
import 'package:lesson20_03/utils/validator_url_image.dart';
import 'package:lesson20_03/views/user_info.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  static const ACTION_CREATE = 'create';
  static const ACTION_EDIT = 'edit';
  static const K_CARD_KEY = 'card_key';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AppDatabase? _database;
  FlutterSecureStorage? storage;
  List<User> _users = [];
  List<UserSecure> _usersSecure = [];

  final TextEditingController _firstnameCtrl = TextEditingController();
  final TextEditingController _lastnameCtrl = TextEditingController();
  final TextEditingController _ageCtrl = TextEditingController();
  final TextEditingController _imageCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _cardCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initDatabase();
    storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: IOSAccessibility.first_unlock,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstnameCtrl.dispose();
    _lastnameCtrl.dispose();
    _ageCtrl.dispose();
    _imageCtrl.dispose();
    _phoneCtrl.dispose();
    _cardCtrl.dispose();
  }

  IOSOptions _getIOSOptions() => const IOSOptions(
        accessibility: IOSAccessibility.first_unlock,
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  void _readUserList() async {
    final userDao = _database!.userDao;
    _users = await userDao.findAllUsers();
    final cardValues = await storage!.readAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );

    final List<UserSecure> list = [];
    for (var element in _users) {
      list.add(UserSecure(
          id: element.id,
          card: cardValues['user_${element.id}_$K_CARD_KEY'] ?? ''));
    }
    setState(() {
      _usersSecure = list;
    });
  }

  void _initDatabase() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    _readUserList();
  }

  void clearForm() {
    _firstnameCtrl.clear();
    _lastnameCtrl.clear();
    _ageCtrl.clear();
    _imageCtrl.clear();
    _phoneCtrl.clear();
    _cardCtrl.clear();
  }

  void _insertUser(User user, UserSecure userSecure) async {
    var userId = await _database!.userDao.insertUser(user);
    storage?.write(
        key: 'user_${userId}_$K_CARD_KEY',
        value: userSecure.card,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    clearForm();
    _readUserList();
    setState(() {});
  }

  void _deleteUser(User user) async {
    await _database!.userDao.deleteUser(user);
    storage?.delete(
        key: 'user_${user.id}_$K_CARD_KEY',
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions());
    _readUserList();
    setState(() {});
  }

  void _updateUser(User user, UserSecure userSecure) async {
    await _database!.userDao.updateUser(user);
    storage?.write(
        key: 'user_${user.id}_$K_CARD_KEY',
        value: userSecure.card,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    clearForm();
    _readUserList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _users.length + 1,
        itemBuilder: (context, index) {
          // _getCard(/*item.id*/);
          // print(_cardValues);
          if (index == 0) {
            return Container(
              padding: const EdgeInsets.only(left: 10, top: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'ID',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Text(
                          'Card',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          'Edit',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          'Delete',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  )
                ],
              ),
            );
          }
          index -= 1;
          final item = _users[index];
          return GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(item.id.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text('${item.lastname} ${item.firstname}'),
                          flex: 3,
                        ),
                        Expanded(
                          child: Text(_usersSecure[index].card),
                          flex: 1,
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                _firstnameCtrl.text = item.firstname;
                                _lastnameCtrl.text = item.lastname;
                                _ageCtrl.text = item.age.toString();
                                _imageCtrl.text = item.image;
                                _phoneCtrl.text = item.phone.toString();
                                _cardCtrl.text = _usersSecure[index].card;
                                _dialog(context, ACTION_EDIT, item.id);
                              },
                              icon: const Icon(Icons.edit),
                              color: Colors.blueAccent),
                          flex: 1,
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () => _deleteUser(item),
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserInfo(
                        user: item,
                        userSecure:
                            UserSecure(card: _usersSecure[index].card))));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialog(context, ACTION_CREATE, null);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _dialog(BuildContext context, String action, int? id) async {
    if (action != ACTION_CREATE && action != ACTION_EDIT) {
      throw Exception('Please set action in call _dialog');
    }
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(action == ACTION_CREATE ? 'Create User' : 'Edit User'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    onSaved: (value) {
                      _firstnameCtrl.text = value!;
                    },
                    validator: (value) {
                      if (value == '') return 'Please input firstname';
                      return null;
                    },
                    controller: _firstnameCtrl,
                    decoration: const InputDecoration(
                      hintText: "Firstname*",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _lastnameCtrl.text = value!;
                      });
                    },
                    validator: (value) {
                      if (value == '') return 'Please input lastname';
                      return null;
                    },
                    controller: _lastnameCtrl,
                    decoration: const InputDecoration(
                      hintText: "Lastname*",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _ageCtrl.text = value!;
                      });
                    },
                    validator: (value) {
                      if (value == '') return 'Please input age';
                      int intValue = int.tryParse(value!) ?? 0;
                      if (intValue < 1) return 'Please input real age';
                      if (intValue > 120) return 'Please input real age';
                      return null;
                    },
                    controller: _ageCtrl,
                    decoration: const InputDecoration(
                      hintText: "Age* (min: 1, max: 120)",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _imageCtrl.text = value!;
                      });
                    },
                    validator: (value) {
                      if (value == '') return 'Please input url photo';
                      if (!validateUrlImage(value.toString())) {
                        return 'Please input correct url';
                      }
                      return null;
                    },
                    controller: _imageCtrl,
                    decoration: const InputDecoration(
                      hintText: "Photo* (url to image)",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _phoneCtrl.text = value!;
                      });
                    },
                    validator: (value) {
                      if (value == '') return 'Please input phone';
                      if (value.toString().length < 6) return 'Please input real phone';
                      if (value.toString().length > 7) return 'Please input real phone';
                      return null;
                    },
                    controller: _phoneCtrl,
                    decoration: const InputDecoration(
                      hintText: "Phone* (min: 6 digits, max: 7 digits)",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _cardCtrl.text = value!;
                      });
                    },
                    validator: (value) {
                      if (value == '') return 'Please input card';
                      if (value!.length != 8) return 'Please correct card number';
                      return null;
                    },
                    controller: _cardCtrl,
                    decoration: const InputDecoration(
                      hintText: "Bank card* (8 digits)",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    action == ACTION_CREATE
                        ? _insertUser(
                            User(
                              firstname: _firstnameCtrl.text,
                              lastname: _lastnameCtrl.text,
                              age: int.tryParse(_ageCtrl.text) ?? 0,
                              image: _imageCtrl.text,
                              phone: int.tryParse(_phoneCtrl.text) ?? 0,
                            ),
                            UserSecure(card: _cardCtrl.text))
                        : _updateUser(
                            User(
                              id: id,
                              firstname: _firstnameCtrl.text,
                              lastname: _lastnameCtrl.text,
                              age: int.tryParse(_ageCtrl.text) ?? 0,
                              image: _imageCtrl.text,
                              phone: int.tryParse(_phoneCtrl.text) ?? 0,
                            ),
                            UserSecure(card: _cardCtrl.text));
                    Navigator.pop(context);
                  }
                });
              },
            ),
            FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('CANCEL'),
              onPressed: () {
                setState(() {
                  clearForm();
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
