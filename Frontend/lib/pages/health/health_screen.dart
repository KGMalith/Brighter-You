import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Page'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text(
          "Your Health",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
