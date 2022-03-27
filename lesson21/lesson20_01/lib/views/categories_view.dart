import 'package:flutter/material.dart';
import 'package:lesson20_01/data/category.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson20_01/views/info_view.dart';
import 'package:uuid/uuid.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  Box<Category>? _categoryBox;
  final TextEditingController _titleFieldController = TextEditingController();
  final TextEditingController _descriptionFieldController =
      TextEditingController();
  String titleText = '';
  String descriptionText = '';

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryAdapter());
    Hive.openBox<Category>('category').then((value) {
      setState(() {
        _categoryBox = value;
      });
    });
  }

  void add(String title, String description) async {
    var uuid = const Uuid();
    _categoryBox?.add(Category(uuid.v1(), title, description));
  }

  void delete(String uuid) async {
    _categoryBox!.values
        .map((e) => e.uuid == uuid ? e.delete() : false)
        .toList();
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add category'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      titleText = value;
                    });
                  },
                  controller: _titleFieldController,
                  decoration: const InputDecoration(hintText: "Title Category"),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      descriptionText = value;
                    });
                  },
                  controller: _descriptionFieldController,
                  decoration: const InputDecoration(hintText: "Description Category"),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    add(titleText, descriptionText);
                    _titleFieldController.text = '';
                    _descriptionFieldController.text = '';
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    _titleFieldController.text = '';
                    _descriptionFieldController.text = '';
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: _categoryBox == null
          ? const Center(child: CircularProgressIndicator())
          : ValueListenableBuilder(
              valueListenable: _categoryBox!.listenable(),
              builder: (context, Box<Category> box, widget) {
                return ListView.builder(
                  itemBuilder: (_, index) {
                    final item = box.values.elementAt(index);
                    return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.blue.shade100)),
                          height: 60,
                          child: Center(
                            child: Text(item.title),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => InfoView(
                                    category: item))) //delete(item.uuid),
                        );
                  },
                  itemCount: box.length,
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayTextInputDialog(context),
        tooltip: 'Add Category',
        child: const Icon(Icons.add),
      ),
    );
  }
}
