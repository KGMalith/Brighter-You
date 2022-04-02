import 'package:flutter/material.dart';
import 'pages/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BrighterYouApp());
}

class BrighterYouApp extends StatelessWidget {
  const BrighterYouApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Brighter You',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
