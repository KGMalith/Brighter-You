import 'package:flutter/material.dart';
import '../../widgets/main_drawer.dart';

class FutureVehiclePage extends StatelessWidget {
  const FutureVehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Vehicle Page'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text(
          "Future Vehicle",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
