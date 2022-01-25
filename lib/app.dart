// app.dart

import 'package:flutt_project/screens/location_details/location_details.dart';
import 'package:flutt_project/screens/location_details/locations/locations.dart';
import 'package:flutter/material.dart';
import 'style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          final arguments = settings.arguments as Map<String, dynamic>;
          screen = LocationDetails(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }


  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextTheme(subtitle1: AppBarTextStyle).subtitle1,
      ),
      textTheme: TextTheme(
        subtitle1: TitleTextStyle,
        bodyText1: Body1TextStyle,
        subtitle2: SubTitleTextStyle,
        caption: CaptionTextStyle,
      ),
    );
  }
}
