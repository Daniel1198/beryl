import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../_variables.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          backgroundColor: Colors.white.withOpacity(0.8),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Inscription',
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
                    'S\'inscrire',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: primaryColor.withOpacity(0.8)),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Veuillez renseigner vos informations.',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ex: John Doe',
                              labelText: 'Nom & Prénom(s)',
                              suffixIcon: Icon(CupertinoIcons.keyboard)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ex: xxx@domain',
                              labelText: 'Email',
                              suffixIcon: Icon(CupertinoIcons.envelope)),
                        ),
                        SizedBox(height: 20),
                        InternationalPhoneNumberInput(
                          errorMessage: 'Numéro de téléphone invalide',
                          hintText: 'Téléphone',
                          onInputChanged: (PhoneNumber number) {},
                          onInputValidated: (bool value) {},
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          formatInput: true,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {},
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: datePicker,
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(DateTime.now().year + 1));

                            if (date != null) {
                              datePicker.text =
                                  DateFormat("dd/MM/yyyy").format(date);
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ex: DD/MM/YYYY',
                              labelText: 'Date de naissance',
                              suffixIcon: Icon(CupertinoIcons.calendar)),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Ex: 01324562456',
                              labelText: 'Numéro de compte',
                              suffixIcon: Icon(CupertinoIcons.keyboard)),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () {},
                          color: primaryColor,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'S\'enregistrer'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("login");
                          },
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Se connecter'.toUpperCase(),
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
