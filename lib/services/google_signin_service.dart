import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      final url = Uri(
        scheme: 'https',
        host: 'flttr-auth.herokuapp.com',
        path: '/google',
      );

      final session = await http.post(url, body: {'token': googleKey.idToken});

      print(session.body);

      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
