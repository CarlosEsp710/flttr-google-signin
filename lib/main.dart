import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_auth/services/google_signin_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Auth App'),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.doorOpen),
              onPressed: () => GoogleSignInService.signOut(),
            ),
          ],
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    splashColor: Colors.transparent,
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        Text(
                          '  Sign in with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    onPressed: () => GoogleSignInService.signInWithGoogle(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
