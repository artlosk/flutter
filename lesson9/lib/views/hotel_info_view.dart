import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hotels/models/hotel.dart';

class HotelInfoView extends StatefulWidget {
  static const routeName = '/hotel-info';
  final String uuid;

  HotelInfoView({Key key, this.uuid}) : super(key: key);

  @override
  _HotelInfoViewState createState() => _HotelInfoViewState();
}

class _HotelInfoViewState extends State<HotelInfoView> {
  bool isLoading = false;
  bool hasError = false;
  HotelInfo hotel;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getDataHotelInfo();
  }

  void getDataHotelInfo() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await _dio.get('https://run.mocky.io/v3/${widget.uuid}');
      var data = response.data;
      hotel = HotelInfo.fromJson(data);
      print(hotel.photos);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : widget.uuid == null || hasError
              ? Center(
                  child: Text('Контент временно недоступен'),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // ClipRect(
                      //   child: Image.asset(
                      //     'assets/images/${hotel.poster}',
                      //     height: 200,
                      //     width: double.infinity,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 2,
                            autoPlay: true,
                          ),
                          items: hotel.photos
                              .map(
                                (item) => Container(
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset('assets/images/$item',
                                                fit: BoxFit.cover,
                                                width: 1000.0),
                                            Positioned(
                                              bottom: 0.0,
                                              left: 0.0,
                                              right: 0.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color.fromARGB(
                                                          200, 0, 0, 0),
                                                      Color.fromARGB(0, 0, 0, 0)
                                                    ],
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 20.0),
                                                child: Text(
                                                  'No. ${hotel.photos.indexOf(item)} image',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              )
                              .toList()),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: 'Страна: '),
                                      TextSpan(
                                        text: hotel.address.country,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(4.0)),
                                RichText(
                                  text: TextSpan(
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: 'Город: '),
                                      TextSpan(
                                        text: hotel.address.city,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(4.0)),
                                RichText(
                                  text: TextSpan(
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: 'Улица: '),
                                      TextSpan(
                                        text: hotel.address.street,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(4.0)),
                                RichText(
                                  text: TextSpan(
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: 'Рейтинг: '),
                                      TextSpan(
                                        text: hotel.rating.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: Text('Сервисы',
                                  style: TextStyle(fontSize: 24)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: Text('Платные',
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                      ...hotel.services.paid.map((e) => Text(e,
                                          style: TextStyle(fontSize: 12)))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: Text('Бесплатные',
                                            style: TextStyle(fontSize: 18)),
                                      ),
                                      ...hotel.services.free.map((e) => Text(e,
                                          style: TextStyle(fontSize: 12))),
                                      ...hotel.services.free.map((e) => Text(e,
                                          style: TextStyle(fontSize: 12))),
                                      ...hotel.services.free.map((e) => Text(e,
                                          style: TextStyle(fontSize: 12)))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
