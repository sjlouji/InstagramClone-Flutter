import 'package:flutter/material.dart';
import 'package:instagramclone/data/StoryData.dart';

void main() {
  runApp(StoryWidget());
}

class StoryWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyStory();
  }
}

class MyStory extends StatefulWidget {
  MyStory ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyStoryState createState() => _MyStoryState();
}

class _MyStoryState extends State<MyStory> {

  final decoratorsInside = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );

  final decoratorsOutline = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.orange, Colors.orangeAccent, Colors.pink]),
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(32),
  );


  final decoratorsOutlineNoStory = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.white, Colors.grey]),
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(32),
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: stories.map((story) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: story.seen?decoratorsOutlineNoStory:decoratorsOutline,
                    child: Container(
                      padding: EdgeInsets.all(
                        2,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
//                        child: Image(
//                          image: NetworkImage(story.image),
//                          width: 45,
//                          height: 45,
//                          fit: BoxFit.cover,
//                        ),
                      child: FadeInImage(
                        image: NetworkImage(story.image),
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/placeholderforavatar.png'),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(story.name,style: TextStyle(fontSize: 12),),
                ],
              );
            }).toList(),
          ),
        ),      ],
    );
  }
}
