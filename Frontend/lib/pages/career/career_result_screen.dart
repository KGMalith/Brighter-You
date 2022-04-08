import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class CareerResultScreen extends StatefulWidget {
  const CareerResultScreen({Key? key}) : super(key: key);

  @override
  _CareerResultScreenState createState() => _CareerResultScreenState();
}

class _CareerResultScreenState extends State<CareerResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career'),
      ),
      body:ListView.builder(
        itemBuilder: (context,index){
          return Card (
            child:Padding(
              padding: const EdgeInsets.only(top:32.0, bottom:32.0, left: 16.0, right: 16.0),
              child: Column(children: <Widget>[
              Text(
                'User Name',
                style:TextStyle(
                  fontSize: 22),
                  ),
              Text('Permanant position in the same company',
              style:TextStyle(
                  fontSize: 22,
                  fontWeight:FontWeight.bold),
              ),
            ],
            ),
            ),
          );
        },
        itemCount: 10,
        )
    );
  }
}
