import 'package:brighter_you/pages/health/health_result_negative.dart';
import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';
import 'health_result_positive.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  final ageController = TextEditingController();
  final foodTypeController = TextEditingController();
  final foodOnTimeController = TextEditingController();
  final exerciseController = TextEditingController();
  final sweetsController = TextEditingController();
  final sleepController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    foodTypeController.dispose();
    foodOnTimeController.dispose();
    exerciseController.dispose();
    sweetsController.dispose();
    sleepController.dispose();
    super.dispose();
  }

  int _foodType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Know your health in 5 years'),
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Question 01
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 40, bottom: 0.5, left: 40),
                child: const Text(
                  "What is your age?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Answers 01
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 0.5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: ageController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            //Question 02
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 0.5, left: 40),
                child: const Text(
                  "What is your food type?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Answers 02
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 0.5),
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
                controller: foodTypeController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            //Question 03
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 0.5, left: 40),
                child: const Text(
                  "Do you have food on time?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Answers 03
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 0.5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: foodOnTimeController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            //Question 04
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 0.5, left: 40),
                child: const Text(
                  "How often do you do exercises?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Answers 04
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 0.5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: exerciseController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            //Question 05
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 0.5, left: 40),
                child: const Text(
                  "How often you eat sweets?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Answers 05
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 0.5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: sweetsController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            //Question 06
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 0.5, left: 40),
                child: const Text(
                  "Do you sleep at least 6 hours daily?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff01122b),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Answers 06
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 0.5),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[350],
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: sleepController,
                cursorColor: const Color(0xff01122b),
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            GestureDetector(
              onTap: () => {
                if (int.parse(ageController.text) > 18 &&
                    int.parse(ageController.text) < 30)
                  {
                    if (foodTypeController.text.toString() == 'normal' &&
                        foodOnTimeController.text.toString() == 'yes' &&
                        exerciseController.text.toString() == 'everyday' &&
                        sweetsController.text.toString() == 'very rarely' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthResultPositive()))
                      }
                    else if (foodTypeController.text.toString() ==
                            'vegetarian' &&
                        foodOnTimeController.text.toString() == 'yes' &&
                        exerciseController.text.toString() == 'everyday' &&
                        sweetsController.text.toString() == 'very rarely' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthResultPositive()))
                      }
                    else if (foodTypeController.text.toString() ==
                            'junck food' &&
                        foodOnTimeController.text.toString() == 'no' &&
                        exerciseController.text.toString() == 'very rarely' &&
                        sweetsController.text.toString() ==
                            'after every meal' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthResultNegativa()))
                      }
                  }
                else if (int.parse(ageController.text) > 30 &&
                    int.parse(ageController.text) < 60)
                  {
                    if (foodTypeController.text.toString() == 'normal' &&
                        foodOnTimeController.text.toString() == 'yes' &&
                        exerciseController.text.toString() == 'everyday' &&
                        sweetsController.text.toString() == 'very rarely' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthResultPositive()))
                      }
                    else if (foodTypeController.text.toString() ==
                            'vegetarian' &&
                        foodOnTimeController.text.toString() == 'yes' &&
                        exerciseController.text.toString() == 'everyday' &&
                        sweetsController.text.toString() == 'very rarely' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthResultPositive()))
                      }
                    else if (foodTypeController.text.toString() ==
                            'junck food' &&
                        foodOnTimeController.text.toString() == 'yes' &&
                        exerciseController.text.toString() == 'everyday' &&
                        sweetsController.text.toString() == 'very rarely' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthResultPositive()))
                      }
                    else if (foodTypeController.text.toString() ==
                            'junck food' &&
                        foodOnTimeController.text.toString() == 'no' &&
                        exerciseController.text.toString() == 'very rarely' &&
                        sweetsController.text.toString() ==
                            'after every meal' &&
                        sleepController.text.toString() == 'yes')
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthResultNegativa()))
                      }
                  }
                else if (ageController.text.toString() == '' ||
                    foodTypeController.text.toString() == '' ||
                    foodOnTimeController.text.toString() == '' ||
                    exerciseController.text.toString() == '' ||
                    sweetsController.text.toString() == '' ||
                    sleepController.text.toString() == '')
                  {
                    Fluttertoast.showToast(
                        msg: 'All the fields are required',
                        backgroundColor: const Color.fromARGB(255, 253, 49, 49),
                        textColor: Colors.white)
                  }
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 90, right: 90, top: 50, bottom: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 21, 120, 206),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: const Text(
                  "Know your result",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
