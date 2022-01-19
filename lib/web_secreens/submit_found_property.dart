import 'dart:html';

import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:finda/components/rounded_button.dart';
import 'package:finda/components/bottom_bar.dart';
import 'package:finda/components/detail_fields.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class LostProperty extends StatefulWidget {
  @override
  _LostPropertyState createState() => _LostPropertyState();
}

class _LostPropertyState extends State<LostProperty> {
  List<Widget> lostInfo(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Submit Lost Property",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "# Our Intelligent Matching System Finds Found Property",
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
                "# Receive Notifications of Matching Lost Items",
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
                "# Help us Find The Owner of What Was Lost",
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
                "* Please be descriptive when reporting found property, the more information you give us the better chance we have of reuniting the lost property to the owner.,",
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
          "assets/images/submit_lost_property.jpg",
          width: width,
        ),
      ),
    ];
  }

  List<Widget> lostDetails(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 2, 50),
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    elevation: 10,
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
              label1: "First Name Indicated on Found Document *",
              label2:
                  "(Please type the first name indicated on the document you have picked)",
              hintText: "First name",
              regulator: docfirstnameController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Last Name Indicated on Found Document *",
              label2:
                  "(Please type the last name indicated on the document you have picked)",
              hintText: "Last Name",
              regulator: doclastnameController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Date Of Birth",
              label2:
                  "Please add the date of birth attached to the found document",
              hintText: "03_11_2021",
              regulator: dateofbirthController,
              keyboard: TextInputType.datetime,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DetailField(
              label1: "Gender *",
              label2: "Please add the gender attached to the found item.",
              regulator: genderController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Nationality *",
              label2:
                  "Please add the exact nationality attached to the found item.",
              regulator: nationalityController,
            ),
            SizedBox(
              height: 10,
            ),
            //image space
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.upload_file),
                    iconSize: 28,
                    tooltip: "Attach Image of the item",
                    onPressed: startWebFilePicker,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (_selectedFile != null)
                    kIsWeb
                        ? Image.memory(
                            _selectedFile,
                            fit: BoxFit.fitHeight,
                            height: 250,
                            width: 200,
                          )
                        : Image.memory(
                            _selectedFile,
                            fit: BoxFit.fitHeight,
                            height: 250,
                            width: 200,
                          ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    ];
  }

// method for selecting image
  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();

      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }

  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
    });
  }

  List<Widget> lostDetails2(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location Information',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Where Lost *",
              label2:
                  "Please provide an approximate location of the lost property (University Canteens, Restaurant, Parking Yard, etc.)",
              hintText: "Item's Lost Location",
              regulator: locationController,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            DetailField(
              label1: "More Location Informattion",
              label2:
                  "Please enhance the location description of the lost property. But it's optional",
              hintText: "You can add additional location information",
            ),
          ],
        ),
      )
    ];
  }

  List<Widget> lostDetails3(double width) {
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
              label2:
                  "Please enter your first name(This will appear on your submission)",
              hintText: "First Name",
              regulator: firstnameController,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.5,
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
            DetailField(
              label1: "Last Name",
              label2:
                  "Please enter your last name(This will appear on your submission)",
              regulator: lastnameController,
            ),
            SizedBox(
              height: 10,
            ),
            DetailField(
              label1: "Email",
              label2:
                  "Please enter your email(This will appear on your submission)",
              regulator: emailController,
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

  // variable to hold image to be displayed

  List<int> _selectedFile;
  Uint8List _bytesData;

  final TextEditingController docfirstnameController =
      new TextEditingController();
  final TextEditingController doclastnameController =
      new TextEditingController();
  final TextEditingController dateofbirthController =
      new TextEditingController();
  final TextEditingController genderController = new TextEditingController();
  final TextEditingController nationalityController =
      new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController firstnameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  String tel;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          Column(
            children: [
              Expanded(
                child:
          ListView(
        children: [
          SizedBox(height: 10),
          Container(
            color: Colors.white.withOpacity(0.6),
            width: size.width,
            height: size.height * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lostInfo(
                size.width / 2,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.6),
            width: size.width,
            height: size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lostDetails(
                size.width / 2,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.6),
            width: size.width,
            height: size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: lostDetails2(
                size.width / 2,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.6),
            width: size.width,
            height: size.height * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: lostDetails3(
                size.width / 2,
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                submitButton(),
              ]),
          SizedBox(
            height: 10,
          ),
          BottomBar(),
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
            title: Text(
                'Thank You for Submitting the ' + selectedItem + " found.",
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
                          Icons.check,
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

  submitButton() {
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
              TypewriterAnimatedText('Submission is in process...',
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  speed: Duration(milliseconds: 80)),
            ],
            repeatForever: true,
          )
        ],
      );
    } else {
      return RoundButton(
        text: "SUBMIT",
        color: Colors.blue,
        press: () async {
          if (selectedItem == "" ||
              docfirstnameController.text == "" ||
              doclastnameController.text == "" ||
              dateofbirthController.text == "" ||
              genderController.text == "" ||
              nationalityController.text == "" ||
              // ignore: unrelated_type_equality_checks
              _selectedFile == "" ||
              locationController.text == "" ||
              firstnameController.text == "" ||
              lastnameController.text == "" ||
              emailController.text == "" ||
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
                    docfirstnameController.text.toUpperCase(),
                    doclastnameController.text.toUpperCase(),
                    dateofbirthController.text.toUpperCase(),
                    genderController.text.toUpperCase(),
                    nationalityController.text.toUpperCase(),
                    locationController.text.toUpperCase(),
                    firstnameController.text.toUpperCase(),
                    lastnameController.text.toUpperCase(),
                    emailController.text,
                    tel,
                    _selectedFile,
                  )
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

  save(
      String selecteditem,
      docfirstname,
      doclastname,
      dateofbirth,
      gender,
      nationality,
      location,
      firstname,
      lastname,
      email,
      phone,
      List<int> _selectedFile) async {
    print(_selectedFile);

    var request = http.MultipartRequest(
        'POST', Uri.parse("https://findabackend.herokuapp.com/public/api/submit/file"));
    request.fields.addAll({
      "selecteditem": selecteditem,
      "docfirstname": docfirstname,
      "doclastname": doclastname,
      "dateofbirth": dateofbirth,
      "gender": gender,
      "nationality": nationality,
      "location": location,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
    });
    request.files.add(http.MultipartFile.fromBytes('pic', _selectedFile,
        contentType: new MediaType('application', 'octet-stream'),
        filename: "fileName"));

    request.send().then((response) {
      print("test");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Uploaded!");
        createAlert(context).then((value) {
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        print('no');
      }
    });
  }
}
