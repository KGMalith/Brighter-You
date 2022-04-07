import 'package:brighter_you/models/login_request_model.dart';
import 'package:brighter_you/pages/home_screen.dart';
import 'package:brighter_you/services/auth_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_screen.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAPIcallProcess = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget initWidget(BuildContext context) {
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
                  "LOGIN",
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
                  if (validateAndSave(emailController.text.toString(),
                      passwordController.text.toString())) {
                    setState(() {
                      isAPIcallProcess = true;
                    });

                    LoginRequestModel loginModel = LoginRequestModel(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString());
                    APIService.login(loginModel).then((response) async {
                      //map respond
                      Map<String, dynamic> respond =
                          jsonDecode(response.toString());

                      if (respond['status']) {
                        setState(() {
                          isAPIcallProcess = false;
                        });
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.setString('Bearer_Token', respond['token']);
                        await pref.setString('user_name', respond['user_name']);
                        await pref.setString(
                            'user_email', respond['user_email']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
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
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Email and Password Cannot be empty',
                        backgroundColor: Color.fromARGB(255, 219, 136, 41),
                        textColor: Colors.white);
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
                    isAPIcallProcess ? "LOADING" : "LOGIN",
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
                  const Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()))
                    },
                    child: const Text(
                      "Register Now",
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

  //validate function
  bool validateAndSave(email, password) {
    if ((email == null || email == '') ||
        (password == null || password == '')) {
      return false;
    } else {
      return true;
    }
  }
}
