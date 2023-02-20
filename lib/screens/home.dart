// ignore_for_file: prefer_const_constructors

import 'package:beryl/_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              MaterialButton(
                minWidth: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Icon(CupertinoIcons.person),
              ),
            ],
          ),
          backgroundColor: Colors.white.withOpacity(0.8),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
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
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Bienvenue !',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ubuntu(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Veuillez sélectionner une option pour continuer.',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    child: GridView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("appointment");
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(33, 18, 57, 88)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/rendez-vous.png'),
                                  width: 50,
                                ),
                                Text(
                                  'PRISE DE RENDEZ-VOUS',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      textStyle: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                      color: primaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(33, 18, 57, 88)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/creer-un-compte.png'),
                                width: 50,
                              ),
                              Text(
                                'OUVRIR UN COMPTE',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                    color: primaryColor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(33, 18, 57, 88)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/service-clients.png'),
                                width: 50,
                              ),
                              Text(
                                'DISCUTER AVEC UN AGENT',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                    color: primaryColor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(33, 18, 57, 88)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage('assets/images/credit.png'),
                                width: 50,
                              ),
                              Text(
                                'DEMANDE DE CREDIT',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                    color: primaryColor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(33, 18, 57, 88)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage('assets/images/reclamer.png'),
                                width: 50,
                              ),
                              Text(
                                'FAIRE UNE RECLAMATION',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                    color: primaryColor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(33, 18, 57, 88)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/suivi-du-temps.png'),
                                width: 50,
                              ),
                              Text(
                                'SUIVRE MES DEMANDES',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                    color: primaryColor),
                              )
                            ],
                          ),
                        ),
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
