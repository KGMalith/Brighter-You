import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class FutureCareerPage extends StatelessWidget {
  const FutureCareerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Career Page'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text(
          "Future Career",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
