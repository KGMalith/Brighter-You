import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class FutureQuestionPredictions extends StatelessWidget {
  const FutureQuestionPredictions({Key? key}) : super(key: key);

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
