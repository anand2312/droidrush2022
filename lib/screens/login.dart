import 'package:carousel_slider/carousel_slider.dart';
import 'package:edwards_pet/colors.dart';
import 'package:edwards_pet/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _signingIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: _signingIn
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        PetRushColors.papayaWhip),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                onPressed: () async {
                  setState(() {
                    _signingIn = true;
                  });
                  UserCredential userCred = await signInWithGoogle();
                  setState(() {
                    _signingIn = false;
                  });
                  if (userCred.user != null) {
                    if (!mounted) return; // async buildcontext gap warning
                    Navigator.pushNamed(context, '/home');
                  } else {
                    print(
                        "Whoops sign in didnt work"); // TODO: better error handling
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'media/google_logo.png',
                        height: 35,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.5),
                        child: Text('Sign in with Google',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                            )),
                      )
                    ],
                  ),
                )));
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Contains the actual buttons for the login/sign-up functionality.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: PetRushColors.primaryBgDark()),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 0),
                  child: Image.asset(
                    'media/logo.png',
                    height: 275,
                    width: 250,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Text(
                    'PetRush',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: PetRushColors.primaryTextLight()),
                  )),
              CarouselSlider(items: const <Widget>[
                Center(
                  child: Text('Welcome to PetRush!'),
                ),
                Center(child: Text('We will help you find your ideal pet')),
                Center(
                    child: Text('Connect with animal shelters and volunteers'))
              ], options: CarouselOptions(height: 200, aspectRatio: 16 / 9))
            ],
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: PetRushColors.charcoal,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: const Center(
              child: GoogleSignInButton(),
            ),
          ))
        ],
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if not logged in
          if (!snapshot.hasData) {
            return const LoginScreen();
          } else {
            // user is logged in
            return const HomeScreen();
          }
        });
  }
}
