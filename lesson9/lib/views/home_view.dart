import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';

  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String viewBlocks = 'list';
  bool isLoading = false;
  bool hasError = false;
  List<HotelPreview> hotels;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    //getDataHotelsViaHttp();
    getDataHotelsViaDio();
  }

  void getDataHotelsViaDio() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await _dio.get(
          'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var data = response.data;
      hotels = data.map<HotelPreview>((hotel) =>
          HotelPreview.fromJson(hotel)).toList();
    } on DioError catch (e) {
      setState(() {
        print(e.response.statusCode);
        print(e.response.statusMessage);
        hasError = true;
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void getDataHotelsViaHttp() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http
          .get(Uri.parse('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'));
      var data = json.decode(response.body);
      hotels = data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList();
    } catch (e) {
      setState(() {
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(viewBlocks);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                viewBlocks = 'list';
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              setState(() {
                viewBlocks = 'grid';
              });
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Text('Error'),
                )
              : viewBlocks == 'list'
                  ? ListView(
                      children: [
                        ...hotels.map((hotel) {
                          return Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                    'assets/images/${hotel.poster}',
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(hotel.name),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: ElevatedButton(
                                          child: Text('Подробнее'),
                                          onPressed: () {
                                            Navigator.of(context).pushNamed('/hotel-info', arguments: {'uuid': hotel.uuid});
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
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image.asset(
                                        'assets/images/${hotels[index].poster}',
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5.0),
                                    color: Colors.white,
                                    child: Text(
                                      hotels[index].name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text('Подробнее'),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed('/hotel-info', arguments: {'uuid': hotels[index].uuid});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ));
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                    ),
    );
  }
}
