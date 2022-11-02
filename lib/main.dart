import 'package:edwards_pet/colors.dart';
import 'package:edwards_pet/screens/home.dart';
import 'package:edwards_pet/screens/login.dart';
import 'package:edwards_pet/screens/moredetailspage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PetRush());
}

class PetRush extends StatelessWidget {
  const PetRush({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetRush',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
        '/home': (context) => const HomeScreen(),
        '/moredetails': (context) => const MoreDetailsPage(),
      },
      color: PetRushColors.primaryBgDark(),
      builder: (context, child) {
        return const Scaffold(body: MoreDetailsPage());
      },
    );
  }
}
