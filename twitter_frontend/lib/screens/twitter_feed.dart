import 'package:flutter/material.dart';
import 'package:twitter_frontend/models/tweet.dart';
import 'package:twitter_frontend/screens/add_tweet.dart';
import '../services/api.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTweetScreen()));
        },
        child: Icon(Icons.create),
      ),
      body: FutureBuilder(
        future: APIService().getdata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Tweet> tweetsdata = snapshot.data;

            return ListView.builder(
              itemCount: tweetsdata.length,
              itemBuilder: (context, index) {
                String date = tweetsdata[index].datePosted.toString();
                List<String> dateparts = date.split(" ");

                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 80.0, top: 10.0, left: 10.0, right: 10.0),
                        child: CircleAvatar(
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png'),
                          radius: 25.0,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    tweetsdata[index].user,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    tweetsdata[index].username,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    dateparts[0],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.grey[600],
                                    ),
                                    onPressed: () => APIService()
                                        .deleteTweet(tweetsdata[index]),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  tweetsdata[index].content,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mode_comment,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        tweetsdata[index].comments.toString(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.loop,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        tweetsdata[index].retweets.toString(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        tweetsdata[index].likes.toString(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
              size: 30.0,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 30.0,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey,
              size: 30.0,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outline,
              color: Colors.grey,
              size: 30.0,
            ),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}

Widget myAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Image.network(
      'https://image.shutterstock.com/image-vector/user-login-authenticate-icon-human-260nw-1365533969.jpg',
      height: 30.0,
      width: 30.0,
    ),
    title: Image.asset(
      'assets/twitter.png',
      height: 30.0,
      width: 30.0,
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      )
    ],
  );
}
