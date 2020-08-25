import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/Model/Feed.dart';
import 'package:instagramclone/data/FeedData.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(FeedWidget());
}

class FeedWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyFeed();
  }
}

class MyFeed extends StatefulWidget {
  MyFeed ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: posts.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image(
                                image: NetworkImage(posts[index].useravatar),
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(posts[index].username),
                                Text(posts[index].profileCaption, style: TextStyle(color: Colors.grey[700], fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert,color: Colors.grey[800],),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  FadeInImage(
                    image: NetworkImage(posts[index].feedImage),
                    placeholder: AssetImage("assets/placeholder.jpg"),
                    width: MediaQuery.of(context).size.width,
                  ),
                  _FeedButton(),
                  _FeedStats(post: posts[index],),
                  _FeedCaption(index: index,),
                ],
              ),
            );
          }),
    );
  }
}

class _FeedStats extends StatelessWidget{

  final Feed post;

  const _FeedStats({
    Key key,
    @required this.post,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: RichText(
        softWrap: true,
        overflow: TextOverflow.visible,
        text: TextSpan(
          children: [
            TextSpan(
              text: post.friendList==null?post.likes+" likes":"Liked by "+post.friendList+" and "+ post.likes+" others",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedCaption extends StatelessWidget{

  final int index;

  const _FeedCaption({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: posts[index].username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: " ${posts[index].caption}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 14,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "Febuary 2020",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}


class _FeedButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(FeatherIcons.heart, color: Colors.grey[800], size: 25,),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FeatherIcons.messageCircle, color: Colors.grey[800], size: 25,),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FeatherIcons.send, color: Colors.grey[800], size: 25,),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(FeatherIcons.bookmark, color: Colors.grey[800], size: 25,),
        ),
      ],
    );
  }
}

