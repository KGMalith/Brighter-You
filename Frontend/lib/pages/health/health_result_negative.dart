import 'package:brighter_you/pages/health/health_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class HealthResultNegativa extends StatefulWidget {
  const HealthResultNegativa({Key? key}) : super(key: key);

  @override
  _HealthResultNegativeState createState() => _HealthResultNegativeState();
}

class _HealthResultNegativeState extends State<HealthResultNegativa> {
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }
}

Widget initWidget(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Know your health in 5 years'),
      shadowColor: const Color(0xff01122b),
    ),
    drawer: const MainDrawer(),
    body: SingleChildScrollView(
      child: Column(
        children: [
          //Result Part 1
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 0.5),
            child: const Center(
              child: Text(
                "You are not in good health",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //Result Part 1
          Container(
            margin: const EdgeInsets.only(top: 0.5, bottom: 0.5),
            child: const Center(
              child: Text(
                "After 5 years",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //Advice
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 0.5),
            child: const Center(
              child: Text(
                "We recomend you to try following",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Image.asset("assets/food.png"),
            height: 100,
            width: 100,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0.5),
            child: const Center(
              child: Text(
                "Eat healthy food",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0.5, bottom: 15),
            child: const Center(
              child: Text(
                "on time",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            child: Image.asset("assets/exercise.jpg"),
            height: 100,
            width: 100,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0.5),
            child: const Center(
              child: Text(
                "Do exercise everyday",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            child: Image.asset("assets/sleep.png"),
            height: 100,
            width: 100,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0.5),
            child: const Center(
              child: Text(
                "Sleep minimum 6 hours",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HealthScreen()))
            },
            child: Container(
              margin:
                  EdgeInsets.only(left: 110, right: 110, top: 50, bottom: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              height: 54,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 21, 120, 206),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              child: Text(
                "Exit",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
