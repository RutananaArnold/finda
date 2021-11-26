import 'package:finda/components/image_slider_mobile.dart';
import 'package:finda/components/mobile_bottom_bar.dart';
import 'package:flutter/material.dart';


class Homemobile extends StatefulWidget {
  @override
  _HomemobileState createState() => _HomemobileState();
}

class _HomemobileState extends State<Homemobile> {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: pageChildren(size.width),
                ),
                ImageSliderMob(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: pageChildren2(size.width),
                ),
                Bottombarmobile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(15, 0, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Finda....",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
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
            //   onPressed: () {},
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
              height: 30,
            ),
            // MaterialButton(
            //   color: Colors.blueAccent,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
            //   onPressed: () {},
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
        padding: const EdgeInsets.symmetric(vertical: 30.0),
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
            SizedBox(
              height: 25,
            ),
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
}
