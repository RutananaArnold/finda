import 'package:finda/mobile_screens/recent_post_mobile.dart';
import 'package:finda/mobile_screens/search_property_mobile.dart';

import 'package:flutter/material.dart';
import 'package:finda/mobile_screens/submit_property_mobile.dart';

import 'home_mobile.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  GlobalKey<ScaffoldState> _openDrawer = GlobalKey<ScaffoldState>();
  Drawer _showDrawer() {
    return Drawer(
        child: Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text("Home"),
              onTap: () {
                setState(() {
                  currentTabIndex = 0;
                });
                openCloseDrawer();
              }),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("SUBMIT FOUND ITEM"),
              onTap: () {
                setState(() {
                  currentTabIndex = 1;
                });
                openCloseDrawer();
              }),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("SEARCH LOST ITEM"),
              onTap: () {
                setState(() {
                  currentTabIndex = 2;
                });
                openCloseDrawer();
              }),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text("REVIEW RECENT POSTS"),
              onTap: () {
                setState(() {
                  currentTabIndex = 3;
                });
                openCloseDrawer();
              }),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Copyright © 2021 | Finda',
                style: TextStyle(
                  color: Colors.blueGrey[300],
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  List<Widget> tabs = [
    Homemobile(),
    SubmitItem(),
    SearchingPoint(),
    RecentpostMob(),
  ];

  int currentTabIndex = 0;

  void openCloseDrawer() {
    if (_openDrawer.currentState.isDrawerOpen) {
      _openDrawer.currentState.openEndDrawer();
    } else {
      _openDrawer.currentState.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _showDrawer(),
      key: _openDrawer,
      appBar: AppBar(
        title: Text("Finda"),
      ),
      body: tabs[currentTabIndex],
    );
  }
}
