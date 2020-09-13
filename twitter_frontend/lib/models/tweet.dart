import 'dart:convert';

List<Tweet> tweetFromJson(String str) =>
    List<Tweet>.from(json.decode(str).map((x) => Tweet.fromJson(x)));

String tweetToJson(List<Tweet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tweet {
  Tweet({
    this.id,
    this.user,
    this.username,
    this.content,
    this.comments,
    this.retweets,
    this.likes,
    this.datePosted,
  });

  int id;
  String user;
  String username;
  String content;
  int comments;
  int retweets;
  int likes;
  DateTime datePosted;

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        id: json["id"],
        user: json["user"],
        username: json["username"],
        content: json["content"],
        comments: json["comments"],
        retweets: json["retweets"],
        likes: json["likes"],
        datePosted: DateTime.parse(json["date_posted"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "username": username,
        "content": content,
        "comments": comments,
        "retweets": retweets,
        "likes": likes,
        "date_posted": datePosted.toString()
        // "${datePosted.year.toString().padLeft(4, '0')}-${datePosted.month.toString().padLeft(2, '0')}-${datePosted.day.toString().padLeft(2, '0')}",
      };
}
