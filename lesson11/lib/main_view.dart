import 'package:flutter/material.dart';
import 'package:hero_card/detail_view.dart';
import 'package:hero_card/space.dart';

class MainView extends StatefulWidget {
  const MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    Tween tween = Tween<double>(begin: 0.0, end: 200.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailView(data: spaces[index]),
              ),
            );
          },
          child: SizedBox(
            height: 150,
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.grey[600]),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Hero(
                    tag: '${spaces[index].id}-image',
                    child: Material(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.asset(spaces[index].image,
                            height: 70,
                            width: double.infinity,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 85,
                    right: 0,
                    left: 0,
                    child: Hero(
                      tag: '${spaces[index].id}-description',
                      child: Material(
                        color: Colors.grey[600],
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            '${spaces[index].description.substring(0, 39)}...',
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 47,
                    child: Hero(
                      tag: '${spaces[index].id}-icon',
                      child: Material(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.orange,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
