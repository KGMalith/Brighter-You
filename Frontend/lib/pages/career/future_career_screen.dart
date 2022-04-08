import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';
import 'package:brighter_you/models/career_request_model.dart';
import 'package:brighter_you/pages/career/career_result_screen.dart';
import 'package:brighter_you/services/auth_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FutureCareerPage extends StatefulWidget {
  const FutureCareerPage({Key? key}) : super(key: key);

  @override
  _FutureCareerState createState() => _FutureCareerState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Career Page'),
      ),
      body: const Center(
        child: Text(
          "Future Career",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}

class _FutureCareerState extends State<FutureCareerPage> {
  bool isAPIcallProcess = false;
  var ageController = TextEditingController();
  var civilStatusController = TextEditingController();
  var jobStatusController = TextEditingController();
  var jobTitleController = TextEditingController();
  var dependantController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    ageController.dispose();
    civilStatusController.dispose();
    jobStatusController.dispose();
    jobTitleController.dispose();
    dependantController.dispose();
    super.dispose();
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [           

            //Title
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 0.5),
              child: const Center(
                child: Text(
                  "FUTURE CAREER",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Input fields
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: ageController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.auto_stories,
                      color: Color(0xff01122b),
                    ),
                    hintText: "Enter Current Age",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: civilStatusController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.auto_stories,
                      color: Color(0xff01122b),
                    ),
                    hintText: "Enter Civil Status",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: jobStatusController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.auto_stories,
                      color: Color(0xff01122b),
                    ),
                    hintText: "Enter Job Status",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: jobTitleController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.auto_stories,
                      color: Color(0xff01122b),
                    ),
                    hintText: "Enter Job Title",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: dependantController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.auto_stories,
                      color: Color(0xff01122b),
                    ),
                    hintText: "Enter the number of dependants",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            AbsorbPointer(
            absorbing: isAPIcallProcess ? true : false,
            child: GestureDetector(
              onTap: () {
                if (validateAndSave(
                    ageController.text.toString(),
                    civilStatusController.text.toString(),
                    jobStatusController.text.toString(),
                    jobTitleController.text.toString(),
                    dependantController.text.toString())) {
                  setState(() {
                    isAPIcallProcess = true;
                  });
                  CareerRequestModel careerModel = CareerRequestModel(
                      age: ageController.text.toString(),
                      civilStatus: civilStatusController.text.toString(),
                      jobStatus: jobStatusController.text.toString(),
                      jobTitle: jobTitleController.text.toString(),
                      dependants: dependantController.text.toString());

                  APIService.career(careerModel).then((response) async {
                    Map<String, dynamic> respond =
                        jsonDecode(response.toString());
                    if (respond['status']) {
                      setState(() {
                        isAPIcallProcess = false;
                      });
                      Fluttertoast.showToast(
                          msg: respond['msg'],
                          backgroundColor: Colors.green,
                          textColor: Colors.white);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CareerResultScreen())); //Change this into the function in directed page
                    } else {
                      setState(() {
                        isAPIcallProcess = false;
                      });
                      Fluttertoast.showToast(
                          msg: respond['err'],
                          backgroundColor: Colors.redAccent,
                          textColor: Colors.white);
                    }
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color(0xff01122b)),
                    (new Color(0xff2b4366))
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: Text(
                  isAPIcallProcess ? "LOADING RESULTS" : "SAVE",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CareerResultScreen()))//Change this into the function in directed page
                    },
                    child: const Text(
                      "See previous results",
                      style: TextStyle(color: Color(0xff2b4366)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

    bool validateAndSave(age, civilStatus, jobStatus,jobTitle,dependants) {
    if ((age == null || age == '') ||
        (civilStatus == null || civilStatus == '') ||
        (jobStatus == null || jobStatus == '') ||
        (jobTitle == null || jobTitle == '') ||
        (dependants == null || dependants == '')) {
      return false;
    } else {
      return true;
    }
  }

}
