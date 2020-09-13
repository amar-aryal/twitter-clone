import 'package:flutter/material.dart';
import 'package:twitter_frontend/models/tweet.dart';
import 'package:twitter_frontend/services/api.dart';

class AddTweetScreen extends StatefulWidget {
  @override
  _AddTweetScreenState createState() => _AddTweetScreenState();
}

class _AddTweetScreenState extends State<AddTweetScreen> {
  final tweetController = TextEditingController();

  void postTweet() {
    final String postedtweet = tweetController.text;

    if (postedtweet.isNotEmpty) {
      final Tweet tweet = Tweet(content: postedtweet);
      APIService().addTweet(tweet);
      print(postedtweet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: Colors.blue,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              postTweet();
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Tweet',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          controller: tweetController,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[600],
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "What's happening?",
          ),
        ),
      ),
    );
  }
}
