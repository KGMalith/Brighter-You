import 'package:brighter_you/pages/career/future_career_screen.dart';
import 'package:brighter_you/pages/health/health_screen.dart';
import 'package:brighter_you/pages/home_screen.dart';
import 'package:brighter_you/pages/profile/user_profile.dart';
import 'package:brighter_you/pages/questions/future_question_predictions.dart';
import 'package:brighter_you/pages/vehicle/future_vehicle_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: const <Widget>[
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'User email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()))
            },
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()))
            },
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.emoji_events_rounded),
              title: Text(
                'Your Future',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FutureQuestionPredictions()))
            },
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.directions_car_rounded),
              title: Text(
                'Your Future Vehicle',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FutureVehiclePage()))
            },
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.health_and_safety),
              title: Text(
                'Your Future Health',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HealthPage()))
            },
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.auto_stories),
              title: Text(
                'Your Future Career',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FutureCareerPage()))
            },
          ),
          const ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
