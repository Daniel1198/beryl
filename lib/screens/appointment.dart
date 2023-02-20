import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String value = '1';
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
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                'Prise de rendez-vous',
                style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
              ),
            ),
            backgroundColor: Colors.white.withOpacity(0.93),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset("assets/images/illustration-rdv.png")),
                  Stepper(steps: [
                    Step(
                        title: Text('Choix de l\'agence'),
                        content: Container(
                          child: Column(
                            children: [
                              SmartSelect<String>.single(
                                  selectedValue: value,
                                  title: 'Choix de la ville',
                                  choiceItems: [
                                    S2Choice<String>(
                                        value: '1', title: 'Abidjan'),
                                    S2Choice<String>(
                                        value: '2', title: 'Yamoussoukro'),
                                    S2Choice<String>(
                                        value: '3', title: 'Korogho'),
                                    S2Choice<String>(
                                        value: '4', title: 'Bouaké'),
                                    S2Choice<String>(
                                        value: '5', title: 'Agboville'),
                                  ],
                                  onChange: (state) => setState(() {
                                        value = state.value;
                                      }))
                            ],
                          ),
                        ))
                  ])
                ],
              ),
            )),
      ],
    );
  }
}
