import 'package:flutter/material.dart';
import 'package:instagramclone/Screens/Home.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreenPage();
  }
}

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage ({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage > {



  Widget _widgetBody = HomeSectionScreen();
  int _currrentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) async{
    setState(() {
      if(index == 0){
        _currrentIndex = index;
        _widgetBody = HomeSectionScreen();
      }
      else if(index == 1){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 2){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 3){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 4){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFFFFFFFF),
        brightness: Brightness.light,
        centerTitle: true,
        title: Column(
          children: [
            Image.asset('assets/logo.png', width: 100,)
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            FeatherIcons.camera,
            color: Colors.grey[800],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              FeatherIcons.send,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body:  SafeArea(
        child: Container(
          child: _widgetBody,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currrentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: _currrentIndex==0?Icon(MdiIcons.home,size: 25,):Icon(MdiIcons.homeOutline,size: 25),
              title: Text("Feed")
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.search, size: 25),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.plusSquare, size: 25),
              title: Text("Upload")
          ),
          BottomNavigationBarItem(
              icon: _currrentIndex==3?Icon(MdiIcons.heart, size: 25):Icon(MdiIcons.heartOutline, size: 25),
              title: Text("Likes")
          ),
          BottomNavigationBarItem(
              icon: _currrentIndex==4?Icon(MdiIcons.accountCircle, size: 25):Icon(MdiIcons.account, size: 25),
              title: Text("Account")
          ),
        ],
      ),
    );
  }
}
