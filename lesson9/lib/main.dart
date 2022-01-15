import 'package:flutter/material.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/hotel_info_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return HomeView();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case HomeView.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomeView();
            });
          case HotelInfoView.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              if (args != null && args.containsKey('uuid')) {
                return HotelInfoView(uuid: args['uuid']);
              }
              return HotelInfoView();
            });
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomeView();
            });
        }
      },
    );
  }
}
