import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twitter_frontend/models/tweet.dart';

const String url = 'http://10.0.2.2:8000/apis/v1?format=json';

class APIService {
  List<Tweet> tweets = [];

  Future<List<Tweet>> getdata() async {
    http.Response response = await http.get(url);
    final data = tweetFromJson(response.body);

    return data;
  }

  void addTweet(Tweet tweet) async {
    try {
      http.Response response = await http.post('http://10.0.2.2:8000/apis/v1/',
          headers: {'Content-Type': "application/json"},
          body: json.encode(tweet.toJson()));

      if (response.statusCode == 201) {
        tweet.id = json.decode(response.body)['id'];
        tweets.add(tweet);
      }
      print(tweet.toJson());
      print(tweets);
    } catch (e) {
      print(e);
    }
  }

  void deleteTweet(Tweet tweet) async {
    http.Response response =
        await http.delete('http://10.0.2.2:8000/apis/v1/${tweet.id}/');

    if (response.statusCode == 204) {
      tweets.remove(tweet);
    }
  }
}
