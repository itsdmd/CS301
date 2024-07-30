import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBvPTMESPiARDVnHBVjSATtNwMGD-P-uzQ",
            authDomain: "to-do-app-n66jgk.firebaseapp.com",
            projectId: "to-do-app-n66jgk",
            storageBucket: "to-do-app-n66jgk.appspot.com",
            messagingSenderId: "804520119081",
            appId: "1:804520119081:web:bc7e8ece21c871e6928538"));
  } else {
    await Firebase.initializeApp();
  }
}
