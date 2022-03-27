import 'package:flutter/material.dart';
import 'package:lesson20_02/utils/validator_url_image.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  static String folderName = 'download_images';
  late Directory folderDownload;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    createFolderInAppDocDir(folderName);
  }

  Stream<List> _loadImages() async* {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');
    var directory = Directory(_appDocDirFolder.path);
    var images = [];
    var exists = await directory.exists();
    if (exists) {
      final _imagesFile = directory.list(recursive: false);
      _imagesFile.forEach((element) {
        // element.delete();
        var file = File(element.path);
        images.add(file.readAsBytesSync());
      });
    }
    yield images;
  }

  Future<Directory> createFolderInAppDocDir(String folderName) async {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      return _appDocDirFolder;
    } else {
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder;
    }
  }

  Future<void> _download(String url) async {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    final response = await http.get(Uri.parse(url));

    final imageName = path.basename(url);
    final extension = path.extension(imageName, 1);

    if (extension == '.jpg' || extension == '.png') {
      final localPath = path.join(_appDocDirFolder.path, imageName);

      final imageFile = File(localPath);
      imageFile.writeAsBytesSync(response.bodyBytes);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List>(
        stream: _loadImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (_, index) {
                final item = snapshot.data![index];
                return GestureDetector(child: Image.memory(item), onTap: () {});
              },
              itemCount: snapshot.data!.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomSheet: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _controller,
                      validator: (value) {
                        if (value == '') return 'Please input url photo';
                        if (!validateUrlImage(value.toString())) {
                          return 'Please input correct url';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Load'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _download(_controller.text);
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
