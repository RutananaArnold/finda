import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:finda/constant.dart';
import 'package:finda/web_secreens/recent_posts.dart';
import 'package:flutter/material.dart';

import 'home_web.dart';
import 'search_lost_property.dart';
import 'submit_found_property.dart';

class DesktopScreen extends StatefulWidget {
  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen>
    with SingleTickerProviderStateMixin, RestorationMixin {
  TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_scrollable_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestor) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  final ScrollController myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "HOME",
      "SUBMIT FOUND ITEM",
      "SEARCH LOST ITEM",
      "VIEW RECENT POSTS",
    ];
    return Scrollbar(
      showTrackOnHover: true,
      hoverThickness: 10,
      thickness: 10,
      isAlwaysShown: true,
      controller: myScrollController,
      interactive: true,
      child: CustomScrollView(
        controller: myScrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Finda...',
                    textStyle: TextStyle(color: Colors.yellow, fontSize: 25),
                    speed: Duration(milliseconds: 80)),
                TypewriterAnimatedText('Lost it...',
                    textStyle: TextStyle(color: Colors.yellow, fontSize: 25),
                    speed: Duration(milliseconds: 80)),
                TypewriterAnimatedText('List it...',
                    textStyle: TextStyle(color: Colors.yellow, fontSize: 25),
                    speed: Duration(milliseconds: 80)),
                TypewriterAnimatedText('Find it...',
                    textStyle: TextStyle(color: Colors.yellow, fontSize: 25),
                    speed: Duration(milliseconds: 80)),
              ],
              repeatForever: true,
              onTap: () {
                print("Tap Event");
              },
            ),
            backgroundColor: barColor,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.asset('assets/images/items.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: [
                for (final tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            ),
            backgroundColor: dull,
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                Home(),
                LostProperty(),
                FoundProperty(),
                RecentPosts(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
