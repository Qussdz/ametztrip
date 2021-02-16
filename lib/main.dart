import 'package:ametztrip/const/Loading.dart';
import 'package:ametztrip/providers/auth.dart';
import 'package:ametztrip/screens/connexion.dart';
import 'package:ametztrip/screens/home_map.dart';
import 'package:ametztrip/screens/profil.dart';
import 'package:ametztrip/services/geolocation_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: AuthProvider.initialize(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final geoService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getCurrentPosition(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moselle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<Position>(
          builder: (context, position, widget) {
            return (position != null)
                ? Home_map(position)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

/*class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Connexion();
      case Status.Authenticated:
        return ProfilePage();
      default:
        return Connexion();
    }
  }
}*/
