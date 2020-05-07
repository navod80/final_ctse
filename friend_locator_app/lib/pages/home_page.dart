//Reg No: IT17000154
//Name: Madurawala K.S.H.

/*
    References : https://medium.com/flutterpub/flutter-how-to-do-user-login-with-firebase-a6af760b14d5
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendlocatorapp/screens/places_list_screen.dart';
import 'package:friendlocatorapp/services/authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blueAccent,
          title: new Text('Friend Locator App'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body:MaterialButton(
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          textColor: Colors.white,
          splashColor: Colors.blueAccent,
          elevation: 8.0,
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage('assets/friend_locator_image.png'),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 530.0, 8.0, 5.0),
              child: Text("CLICK ME TO ADD A LOCATION", textAlign: TextAlign.center,
                     style: TextStyle(
                      fontSize: 46.0, fontWeight: FontWeight.bold, foreground: Paint() ..color=Colors.white)),
            ),
          ),
          // ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => PlacesListScreen(),
                ));
          },
        ),
        );
  }
}
