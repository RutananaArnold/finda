import 'package:finda/components/image_slider_web.dart';
import 'package:flutter/material.dart';
import 'package:finda/components/bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(15, 0, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Finda....",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Intelligent Lost & Found Online Mechanism",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Finda is an entirely new intelligent lost and found matching system. We have taken a different approach than the traditional lost & founds  by creating a multi-level platform for businesses and individuals to submit lost or found items into our matching system. Once the lost or found items are submitted and placed into our matching system, we intelligently help to find and locate the misplaced goods and who has them.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            // MaterialButton(
            //   color: Colors.grey,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
            //   onPressed: () {
            //        Navigator.of(context).pushAndRemoveUntil(
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => LostProperty(),
            //             fullscreenDialog: true),
            //         (Route<dynamic> route) => true);
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 20.0, horizontal: 40.0),
            //     child: Text(
            //       "Submit Found Item",
            //       style: TextStyle(
            //         color: barColor,
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            // MaterialButton(
            //   color: Colors.blueAccent,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
            //   onPressed: () {
            //        Navigator.of(context).pushAndRemoveUntil(
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => FoundProperty(),
            //             fullscreenDialog: true),
            //         (Route<dynamic> route) => true);
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 20.0, horizontal: 40.0),
            //     child: Text(
            //       "Search Lost Item",
            //       style: TextStyle(
            //         color: barColor,
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          "assets/images/lost_found.png",
          width: width,
        ),
      ),
    ];
  }

  List<Widget> pageChildren2(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(15, 10, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 25,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Intelligent Lost & Found Matching System",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Losing or misplacing your property can be frustrating and become such a hassle to find. At Finda, we answer all that by providing an intelligent lost and found matching system, which automatically identifies, matches, and pairs recently lost or found items with one another.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "We’re working with local and regional institutions to submit found items into our matching system. This helps to maximize reach and gives users a higher rate of success when attempting to locate and find lost property..",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          "assets/images/intel.png",
          width: width,
        ),
      ),
    ];
  }

  // final ScrollController myScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 10),
                Container(
                  color: Colors.white.withOpacity(0.6),
                  width: size.width,
                  height: size.height * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageChildren(
                      size.width / 2,
                    ),
                  ),
                ),
                ImageSlider(),
                Container(
                  color: Colors.white.withOpacity(0.6),
                  width: size.width,
                  height: size.height * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageChildren2(
                      size.width / 2,
                    ),
                  ),
                ),
                BottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
