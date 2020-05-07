import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';
import 'package:friendlocatorapp/services/authentication.dart';
import 'package:friendlocatorapp/pages/root_page.dart';
import './screens/update_place_screen.dart';

void main() {
  runApp(new MyApp());
}

class Routes {
  static const String places_list_screen = '/screens/places_list_screen';
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()),
        routes: {
          Routes.login_signup_page:  (BuildContext context) => LoginSignupPage(),
        },);
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          title: 'Great Places',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          //home: PlacesListScreen(),
          home: new RootPage(auth: new Auth()),
          routes: {
            AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
            PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
            PlacesListScreen.routeName: (ctx) => PlacesListScreen(),
            UpdatePlaceScreen.routeName: (ctx) => UpdatePlaceScreen(),
          }),
    );
  }
}

