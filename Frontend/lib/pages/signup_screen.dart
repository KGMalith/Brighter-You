import 'package:brighter_you/models/register_request_model.dart';
import 'package:brighter_you/services/auth_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_screen.dart';
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  bool isAPIcallProcess = false;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          //Logo
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Image.asset("assets/idea.png"),
            height: 100,
            width: 100,
          ),

          //Login Title
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 0.5),
            child: const Center(
              child: Text(
                "SIGNUP",
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
              controller: fullNameController,
              cursorColor: const Color(0xff01122b),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xff01122b),
                  ),
                  hintText: "Full Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
              controller: emailController,
              cursorColor: const Color(0xff01122b),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff01122b),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
              controller: passwordController,
              obscureText: true,
              cursorColor: const Color(0xff01122b),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xff01122b),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),

          AbsorbPointer(
            absorbing: isAPIcallProcess ? true : false,
            child: GestureDetector(
              onTap: () {
                if (validateAndSave(
                    fullNameController.text.toString(),
                    emailController.text.toString(),
                    passwordController.text.toString())) {
                  setState(() {
                    isAPIcallProcess = true;
                  });
                  RegisterRequestModel registerModel = RegisterRequestModel(
                      name: fullNameController.text.toString(),
                      email: emailController.text.toString(),
                      password: passwordController.text.toString());

                  APIService.register(registerModel).then((response) async {
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
                              builder: (context) => LoginScreen()));
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
                  isAPIcallProcess ? "LOADING" : "REGISTER",
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
                const Text("Already have an account?"),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()))
                  },
                  child: const Text(
                    " Login",
                    style: TextStyle(color: Color(0xff2b4366)),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  //validate function
  bool validateAndSave(fullName, email, password) {
    if ((fullName == null || fullName == '') ||
        (email == null || email == '') ||
        (password == null || password == '')) {
      return false;
    } else {
      return true;
    }
  }
}
