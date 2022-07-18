import 'dart:convert';
// import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/mobile_bottom_bar.dart';
import '../components/rounded_button.dart';
import '../models/searchposts.dart';
import '../pages/search_result.dart';
import 'package:flutter/material.dart';
import '../components/detail_fields.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:another_flushbar/flushbar.dart';

import '../constant.dart';

class SearchingPoint extends StatefulWidget {
  @override
  _SearchingPointState createState() => _SearchingPointState();
}

const _youAre = 'You have';
const _subscri = 'subscribed.';

class _SearchingPointState extends State<SearchingPoint> {
  List<Widget> searchInfo(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search Lost Property",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "# Our Matching System Finds Lost Property",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "# Receive Notifications of Matching Found Items ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "# Extended Reach Out with Local Networks ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "* Please be descriptive when submitting your lost property report, the more information you give us the better chance you have of retrieving your items.",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Image.asset(
          "assets/images/submit_found_property.jpg",
          width: width,
        ),
      ),
    ];
  }

  List<Widget> searchingpersonInfo(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 2, 10),
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Choose Lost Item *",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButton<String>(
                    value: selectedItem,
                    icon: const Icon(Icons.arrow_downward),
                    hint: Text(
                      "Select Any Of the Lost Items",
                      style: TextStyle(color: Colors.black),
                    ),
                    iconSize: 24,
                    elevation: 8,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value;
                      });
                    },
                    items:
                        lostitems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "First Name Indicated on Your Lost Document *",
              label2:
                  "(Please type the first name indicated on the document that got lost)",
              hintText: "First name",
              regulator: lostdocfirstnameController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Last Name Indicated on Your Lost Document *",
              label2:
                  "(Please type the last name indicated on the document that you lost)",
              hintText: "Last Name",
              regulator: lostdoclastnameController,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 5, 18, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailField(
              label1: "Date Of Birth",
              label2:
                  "Please add the date of birth attached to your lost document",
              hintText: "e.g 05_10_2021",
              keyboard: TextInputType.datetime,
              regulator: lostdateofbirthController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Gender *",
              label2: "Please add the gender attached to your lost document.",
              regulator: searchinggenderController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Nationality *",
              label2:
                  "Please add the exact nationality attached to your lost document.",
              regulator: searchingnationalityController,
            ),
          ],
        ),
      )
    ];
  }

  List<Widget> searchingpersonContact(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 2, 5),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "First Name *",
              label2: "Please enter your first name",
              hintText: "First Name",
              regulator: searchingfirstnameController,
            ),
            SizedBox(
              height: 15,
            ),
            DetailField(
              label1: "Last Name",
              label2: "Please enter your last name",
              regulator: searchinglastnameController,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 5, 18, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(15),
                  shape: BoxShape.rectangle),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                initialCountryCode: 'UG',
                onChanged: (phone) {
                  tel = phone.completeNumber;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Email",
              label2: "Please enter your email",
              regulator: searchingemailController,
              keyboard: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    ];
  }

  String selectedItem = "Student ID";

  List<String> lostitems = [
    "Student ID",
    "National ID",
    "Business ID",
    "Academic Pass Slip",
    "Academic Documents",
    "Driving Permit",
  ];

  final TextEditingController searchingitemSelected =
      new TextEditingController();
  final TextEditingController lostdocfirstnameController =
      new TextEditingController();
  final TextEditingController lostdoclastnameController =
      new TextEditingController();
  final TextEditingController lostdateofbirthController =
      new TextEditingController();
  final TextEditingController searchinggenderController =
      new TextEditingController();
  final TextEditingController searchingnationalityController =
      new TextEditingController();
  final TextEditingController searchingfirstnameController =
      new TextEditingController();
  final TextEditingController searchinglastnameController =
      new TextEditingController();
  final TextEditingController searchingemailController =
      new TextEditingController();
  String tel;
  bool _subscribed = false;
  String _messageToUser = "$_youAre  NOT  $_subscri";

  bool _isLoading = false;

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: searchInfo(
                    size.width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: searchingpersonInfo(
                    size.width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: searchingpersonContact(
                    size.width,
                  ),
                ),
                searchsubmitButton(),
                SizedBox(
                  height: 10,
                ),
                Bottombarmobile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ooops!  Network Issues"),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.error_outlined,
                          size: 100,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  Future subscribeAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
                "Ooops!   Sorry our intelligentMatching sytem didn't find any related data\n but you can subscribe to keep updated on any upcoming matching data.",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            content: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.error_outline_outlined,
                          size: 100,
                          color: Colors.yellow,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Subscribe"),
                          Switch(
                              value: _subscribed,
                              onChanged: (value) {
                                setState(() {
                                  _subscribed = value;
                                  _messageToUser = _youAre +
                                      (_subscribed ? "  " : " NOT ") +
                                      _subscri;
                                });
                              }),
                          Text(_messageToUser, textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  searchsubmitButton() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Searching operation is in process...',
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  speed: Duration(milliseconds: 80)),
            ],
            repeatForever: true,
          )
        ],
      );
    } else {
      return RoundButton(
        text: "SUBMIT FOR SEARCHING",
        color: Colors.blue,
        press: () {
          if (selectedItem == "" ||
              lostdocfirstnameController.text == "" ||
              lostdoclastnameController.text == "" ||
              lostdateofbirthController.text == "" ||
              searchinggenderController.text == "" ||
              searchingnationalityController.text == "" ||
              searchingfirstnameController.text == "" ||
              searchinglastnameController.text == "" ||
              searchingemailController.text == "" ||
              tel == "") {
            Flushbar(
              message: "Empty field/s found!",
              icon: Icon(Icons.info_outline, size: 25.0, color: Colors.red),
              duration: Duration(seconds: 3),
              leftBarIndicatorColor: Colors.red,
            )..show(context);
          } else {
            setState(() {
              _isLoading = true;
            });
            prodEnv
                ? save(
                    selectedItem,
                    lostdocfirstnameController.text.toUpperCase(),
                    lostdoclastnameController.text.toUpperCase(),
                    lostdateofbirthController.text.toUpperCase(),
                    searchinggenderController.text.toUpperCase(),
                    searchingnationalityController.text.toUpperCase(),
                    searchingfirstnameController.text.toUpperCase(),
                    searchinglastnameController.text.toUpperCase(),
                    searchingemailController.text,
                    tel)
                : createAlert(context).then((value) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
          }
        },
      );
    }
  }

  // logic

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control_Allow_Origin": "*",
      };

  save(
      String selecteditem,
      lostdocfirstname,
      lostdoclastname,
      lostdocdateofbirth,
      searchinggender,
      searchingnationality,
      searchingfirstname,
      searchinglastname,
      searchingemail,
      phone) async {
    Map data = {
      "selecteditem": selecteditem,
      "lostdocfirstname": lostdocfirstname,
      "lostdoclastname": lostdoclastname,
      "lostdocdateofbirth": lostdocdateofbirth,
      "searchinggender": searchinggender,
      "searchingnationality": searchingnationality,
      "searchingfirstname": searchingfirstname,
      "searchinglastname": searchinglastname,
      "searchingemail": searchingemail,
      "tel": phone,
    };

    print(data);
    var jsonResponse;
    var response = await http.post(
      Uri.parse("https://findabackend.herokuapp.com/public/api/search/item"),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        print(jsonResponse);
        Searchpost searchpost = Searchpost.fromJson(jsonResponse);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => SearchResult(
                searchpost: searchpost,
              ),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      print(jsonResponse);
      subscribeAlert(context).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }
}
