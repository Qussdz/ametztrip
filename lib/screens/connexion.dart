import 'package:ametztrip/const/Loading.dart';
import 'package:ametztrip/const/navigation.dart';
import 'package:ametztrip/providers/auth.dart';
import 'package:ametztrip/screens/inscription.dart';
import 'package:ametztrip/screens/profil.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "",
            style: TextStyle(
              fontFamily: "tepeno",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.grey[50],
        body: authProvider.status == Status.Authenticating
            ? Loading()
            : SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.asset(
                          'assets/Logo.png',
                          height: 100.0,
                          width: 100.0,
                        ),
                        Center(
                          child: Text('Bienvenue en Moselle',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: authProvider.password,
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        FlatButton(
                            onPressed: () async {
                              if (!await authProvider.signIn()) {
                                _key.currentState.showSnackBar(SnackBar(
                                    content: Text("Connexion échouée")));
                                return;
                              }
                              authProvider.clearController();
                              changeScreenReplacement(context, ProfilePage());
                            },
                            color: bleu[900],
                            child: Text('Connexion',
                                style: new TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        OutlineButton(
                          onPressed: () async {
                            if (!await authProvider.googleSignIn()) {
                              _key.currentState.showSnackBar(
                                  SnackBar(content: Text("Connexion échouée")));
                              return;
                            }
                            authProvider.clearController();
                            changeScreenReplacement(context, ProfilePage());
                          },
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black),
                          child: Text('S\'authentifier avec Google'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        OutlineButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Inscription()));
                            /*  return (position != null)
        ? MapPage.Map(position)
        : Center(child: CircularProgressIndicator());
                   */
                          },
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black),
                          child: Text('Besoin d\'un nouveau compte ?'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
