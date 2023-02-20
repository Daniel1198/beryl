// ignore_for_file: prefer_const_constructors
import 'package:beryl/_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidId = false;
  bool isVisible = true;
  bool register = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0.8),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Connexion',
              style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
            ),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/icon.jpg')),
                      ),
                    ),
                  )),
                  SizedBox(height: 50),
                  Text(
                    'Se connecter',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: primaryColor.withOpacity(0.8)),
                  ),
                  !isValidId
                      ? SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Veuillez saisir votre identifiant de connexion.',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ex: 5675KP',
                                    suffixIcon: Icon(CupertinoIcons.keyboard)),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Identifiant oublié ?',
                                  style: GoogleFonts.inter(),
                                ),
                              ),
                              SizedBox(height: 20),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    isValidId = true;
                                  });
                                },
                                color: primaryColor,
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Suivant'.toUpperCase(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("register");
                                },
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Créer un identifiant'.toUpperCase(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Veuillez saisir votre mot de passe.',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: isVisible,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '*********',
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                          });
                                        },
                                        child: Icon(isVisible
                                            ? CupertinoIcons.eye
                                            : CupertinoIcons.eye_slash))),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Mot de passe oublié ?',
                                  style: GoogleFonts.inter(),
                                ),
                              ),
                              SizedBox(height: 20),
                              MaterialButton(
                                onPressed: () {},
                                color: primaryColor,
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Se connecter'.toUpperCase(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    isValidId = false;
                                  });
                                },
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Précédent'.toUpperCase(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
