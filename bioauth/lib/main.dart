import 'package:BioAuth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_app_check/firebase_app_check.dart';
//import 'package:firebase_app_check_platform_interface/firebase_app_check_platform_interface.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'geofence_status_provider.dart'; // Import from separate file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => GeofenceStatusProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioAuth Attendance System',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
    );
  }
}
//
//
// // Create a simple class to hold the geofence status
// class GeofenceStatusProvider with ChangeNotifier {
//   bool _isInsideGeofence = false;
//
//   bool get isInsideGeofence => _isInsideGeofence;
//
//   void updateGeofenceStatus(bool isInside) {_isInsideGeofence = isInside;
//   notifyListeners();
//   }
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   // Initialize App Check with reCAPTCHA v3 (if needed)
//   //await FirebaseAppCheck.instance.activate(
//   //  webProvider: WebProvider.recaptchaV3(siteKey: '6LfBlDAqAAAAAFVHZNFkMKoHR8NG6GtqMgl8ZFqy'),
//   //);
//
//   runApp(
//     ChangeNotifierProvider( // Wrap your app with ChangeNotifierProvider
//       create: (context) => GeofenceStatusProvider(),
//       child: MyApp(),
//     ),
//   );
// }
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BioAuth Attendance System',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }