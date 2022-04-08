import 'package:brighter_you/pages/health/health_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class HealthResultPositive extends StatefulWidget {
  const HealthResultPositive({Key? key}) : super(key: key);

  @override
  _HealthResultPositiveState createState() => _HealthResultPositiveState();
}

class _HealthResultPositiveState extends State<HealthResultPositive> {
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
          //Positive Result Image
          Container(
            margin: const EdgeInsets.only(top: 150),
            child: Image.asset("assets/good_health.png"),
            height: 150,
            width: 150,
          ),
          //Result
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 0.5),
            child: const Center(
              child: Text(
                "You are in good health",
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //Advice
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0.5),
            child: const Center(
              child: Text(
                "We recomend you to continue your daily routine further",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff01122b),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HealthScreen()))
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
