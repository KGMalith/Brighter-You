import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class FutureQuestionPredictions extends StatefulWidget {
  const FutureQuestionPredictions({Key? key}) : super(key: key);

  @override
  _FutureQuestionPredictionsState createState() =>
      _FutureQuestionPredictionsState();
}

class _FutureQuestionPredictionsState extends State<FutureQuestionPredictions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Prediction Page'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text(
          "Future Prediction",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
