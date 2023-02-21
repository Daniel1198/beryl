import 'package:awesome_select/awesome_select.dart';
import 'package:beryl/_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String valueCity = '1';
  String valueAgence = '1';
  String valuePerson = '1';
  String valueHoraire = '1';
  int currentStep = 0;
  TextEditingController datePicker = TextEditingController();
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                'Prise de rendez-vous',
                style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
              ),
            ),
            backgroundColor: Colors.white.withOpacity(0.8),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset("assets/images/illustration-rdv.png")),
                  Stepper(
                      physics: NeverScrollableScrollPhysics(),
                      controlsBuilder:
                          (BuildContext context, ControlsDetails details) {
                        final _isLastStep = currentStep == 2;
                        return Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor),
                                      child: Text(_isLastStep
                                          ? 'ENREGISTRER'
                                          : 'SUIVANT'),
                                      onPressed: details.onStepContinue)),
                              if (currentStep != 0)
                                const SizedBox(
                                  width: 12,
                                ),
                              if (currentStep != 0)
                                Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            foregroundColor:
                                                primaryColor.withOpacity(0.5),
                                            side: BorderSide(
                                                color: primaryColor
                                                    .withOpacity(0.5))),
                                        child: Text('RETOUR'),
                                        onPressed: details.onStepCancel))
                            ]));
                      },
                      currentStep: currentStep,
                      onStepCancel: () {
                        if (currentStep > 0) {
                          setState(() {
                            currentStep -= 1;
                          });
                        }
                      },
                      onStepContinue: () {
                        if (currentStep <= 1) {
                          setState(() {
                            currentStep += 1;
                          });
                        }
                      },
                      onStepTapped: (int index) {
                        setState(() {
                          currentStep = index;
                        });
                      },
                      steps: [
                        Step(
                            title: Text('Choix de l\'agence'),
                            content: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.3))),
                                    child: SmartSelect<String>.single(
                                        modalType: S2ModalType.bottomSheet,
                                        selectedValue: valueCity,
                                        title: 'Choisir la ville',
                                        choiceItems: [
                                          S2Choice<String>(
                                              value: '1', title: 'Abidjan'),
                                          S2Choice<String>(
                                              value: '2',
                                              title: 'Yamoussoukro'),
                                          S2Choice<String>(
                                              value: '3', title: 'Korogho'),
                                          S2Choice<String>(
                                              value: '4', title: 'Bouaké'),
                                          S2Choice<String>(
                                              value: '5', title: 'Agboville'),
                                        ],
                                        onChange: (state) => setState(() {
                                              valueCity = state.value;
                                            })),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.3))),
                                    child: SmartSelect<String>.single(
                                        modalType: S2ModalType.bottomSheet,
                                        selectedValue: valueAgence,
                                        title: 'Choisir l\'agence',
                                        choiceItems: [
                                          S2Choice<String>(
                                              value: '1', title: 'Beryl Abj'),
                                          S2Choice<String>(
                                              value: '2', title: 'Beryl Yakro'),
                                          S2Choice<String>(
                                              value: '3', title: 'Beryl Agb')
                                        ],
                                        onChange: (state) => setState(() {
                                              valueAgence = state.value;
                                            })),
                                  )
                                ],
                              ),
                            )),
                        Step(
                            title: Text('Détails du rendez-vous'),
                            content: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.3))),
                                    child: SmartSelect<String>.single(
                                        modalType: S2ModalType.bottomSheet,
                                        selectedValue: valuePerson,
                                        title: 'Personne à rencontrer',
                                        choiceItems: [
                                          S2Choice<String>(
                                              value: '1', title: 'Directeur'),
                                          S2Choice<String>(
                                              value: '2',
                                              title: 'Chargé(e) de clientèle'),
                                          S2Choice<String>(
                                              value: '3',
                                              title: 'Gestionnaire de compte')
                                        ],
                                        onChange: (state) => setState(() {
                                              valuePerson = state.value;
                                            })),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    controller: datePicker,
                                    keyboardType: TextInputType.datetime,
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(
                                              DateTime.now().year + 1));

                                      if (date != null) {
                                        datePicker.text =
                                            DateFormat("dd/MM/yyyy")
                                                .format(date);
                                      }
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            )),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.3)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Ex: DD/MM/YYYY',
                                        labelText: 'Date de rendez-vous',
                                        suffixIcon:
                                            Icon(CupertinoIcons.calendar)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.3))),
                                    child: SmartSelect<String>.single(
                                        modalType: S2ModalType.bottomSheet,
                                        selectedValue: valueHoraire,
                                        title: 'Horaires de disponibilité',
                                        choiceItems: [
                                          S2Choice<String>(
                                              value: '1',
                                              title: '13:15 à 15:00'),
                                          S2Choice<String>(
                                              value: '2',
                                              title: '9:15 à 11:00'),
                                          S2Choice<String>(
                                              value: '3',
                                              title: '17:15 à 18:00')
                                        ],
                                        onChange: (state) => setState(() {
                                              valueHoraire = state.value;
                                            })),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                        suffixIcon:
                                            Icon(CupertinoIcons.keyboard),
                                        labelText: 'Motif du rendez-vous',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            )),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.3)),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.folder,
                                          color:
                                              Color.fromARGB(255, 145, 121, 44),
                                        ),
                                        SizedBox(width: 20),
                                        Text('Joindre des fichiers')
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      'La taille minimale des fichiers doit être de 1Mb. Les types de fichiers pris en charge sont .jpg, .png, .pdf')
                                ],
                              ),
                            )),
                        Step(
                            title: Text('Confirmation du rendez-vous'),
                            content: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.3))),
                                    child: SmartSelect<String>.single(
                                        modalType: S2ModalType.bottomSheet,
                                        selectedValue: valueCity,
                                        title: 'Choisir la ville',
                                        choiceItems: [
                                          S2Choice<String>(
                                              value: '1', title: 'Abidjan'),
                                          S2Choice<String>(
                                              value: '2',
                                              title: 'Yamoussoukro'),
                                          S2Choice<String>(
                                              value: '3', title: 'Korogho'),
                                          S2Choice<String>(
                                              value: '4', title: 'Bouaké'),
                                          S2Choice<String>(
                                              value: '5', title: 'Agboville'),
                                        ],
                                        onChange: (state) => setState(() {
                                              valueCity = state.value;
                                            })),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.3))),
                                    child: SmartSelect<String>.single(
                                        modalType: S2ModalType.bottomSheet,
                                        selectedValue: valueAgence,
                                        title: 'Choisir l\'agence',
                                        choiceItems: [
                                          S2Choice<String>(
                                              value: '1', title: 'Beryl Abj'),
                                          S2Choice<String>(
                                              value: '2', title: 'Beryl Yakro'),
                                          S2Choice<String>(
                                              value: '3', title: 'Beryl Agb')
                                        ],
                                        onChange: (state) => setState(() {
                                              valueAgence = state.value;
                                            })),
                                  )
                                ],
                              ),
                            )),
                      ])
                ],
              ),
            )),
      ],
    );
  }
}
