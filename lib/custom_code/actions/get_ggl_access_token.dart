// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_sign_in/google_sign_in.dart';

Future<String?> getGglAccessToken() async {
  // Add your function code here!
  try {
    final GoogleSignIn gsi = GoogleSignIn(
      clientId:
          '804520119081-n6isqn7l56tbchd2340h39m3qe5ijlho.apps.googleusercontent.com',
      scopes: <String>[
        'https://www.googleapis.com/auth/calendar',
        'https://www.googleapis.com/auth/calendar.events'
      ],
    );
    final GoogleSignInAccount? gsiacc = await gsi.signIn();
    final GoogleSignInAuthentication gsiauth = await gsiacc!.authentication;
    return gsiauth.accessToken;
  } catch (e) {
    print('Encountered error when authenticating with Google account: $e');
    return null;
  }
}
