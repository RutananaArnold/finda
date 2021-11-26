import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:finda/models/recentposts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class RecentpostMob extends StatefulWidget {
  @override
  _RecentpostMobState createState() => _RecentpostMobState();
}

class _RecentpostMobState extends State<RecentpostMob> {
   Future<List<Recentpost>> fetchPosts() async {
    if (prodEnv = true) {
      var response =
          await http.get(Uri.parse("http://" + apiUrl + "/api/fetch/posts"));
      if (response.statusCode == 200) {
        return recentpostFromJson(response.body);
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: FutureBuilder(
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Recentpost posts = snapshot.data[index];
                  return Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${posts.docfirstname}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Text(
                            "${posts.doclastname}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Text(
                            "${posts.dateofbirth}",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          Text(
                            "${posts.gender}",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          Text(
                            "${posts.nationality}",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Loading all posts...',
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          speed: Duration(milliseconds: 80)),
                    ],
                    repeatForever: true,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}