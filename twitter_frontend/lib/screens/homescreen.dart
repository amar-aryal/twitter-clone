import 'package:flutter/material.dart';
import 'package:twitter_frontend/screens/twitter_feed.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 140.0),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/twitter.png'),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TwitterFeed()));
            },
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            color: Colors.blue,
            child: Text('Get started',
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
          ),
        ],
      ),
    );
  }
}
