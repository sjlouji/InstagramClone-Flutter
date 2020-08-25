import 'package:flutter/material.dart';
import 'package:instagramclone/Model/Feed.dart';
import 'package:instagramclone/Screens/HomeScreen.dart';
import 'package:instagramclone/Widget/Feed.dart';
import 'package:instagramclone/Widget/Storie.dart';

void main() {
  runApp(HomeSectionScreen());
}

class HomeSectionScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomeSectionPage();
  }
}

class HomeSectionPage extends StatefulWidget {
  HomeSectionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeSectionScreenState createState() => _HomeSectionScreenState();
}

class _HomeSectionScreenState extends State<HomeSectionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MyStory(),
                Divider(),
                FeedWidget(),
              ],
            ),
          ),
        )
    );
  }
}
