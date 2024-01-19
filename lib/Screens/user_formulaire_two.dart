import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mysaiph/widgets/custom_text_field.dart';
import 'package:mysaiph/widgets/game_widgets/rounded_button.dart';

import '../Responsive/mobile_screen_layout.dart';
import '../Responsive/responsive_layout_screen.dart';
import '../Responsive/web_screen_layout.dart';
import '../widgets/profile_container.dart';

class UserFormulaireTwo extends StatefulWidget {
  final String pseudo;
  final String date;
  final String tel;
  final String mdp;
  final Uint8List? image;
  UserFormulaireTwo(
      {super.key,
      required this.pseudo,
      required this.date,
      required this.tel,
      required this.mdp,
      this.image});

  @override
  State<UserFormulaireTwo> createState() => _UserFormulaireTwoState();
}

class _UserFormulaireTwoState extends State<UserFormulaireTwo> {
  TextEditingController pharmacieController = TextEditingController();
  TextEditingController crmController = TextEditingController();
  List<String> professions = [
    'Profession',
    'Pharamcien',
    'Medecin',
    'Profession 3',
    // Add more professions as needed
  ];

  String selectedProfession = 'Profession'; // Default selected profession

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      left: false,
      bottom: false,
      top: false,
      right: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff1331C4).withOpacity(0.5),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 0, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileContainer(
                    body: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/profile_pic.png",
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Foulen El Fouleni",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Informations pharmacie",
                        style: TextStyle(
                            color: const Color(0xff1331C4),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(validatorFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer le Nom de la pharmacie';
                            }
                            return null;
                          },
                              textController: pharmacieController,
                              keyboardType: TextInputType.name,
                              label: "Nom de la pharmacie",
                              prefixIcon: Icons.local_pharmacy_outlined),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(textController: crmController,
                              validatorFunction:(value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer le Code';
                                }
                                return null;
                              } ,
                              keyboardType: TextInputType.name,
                              label: "Code client CRM",
                              prefixIcon: Icons.group),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color(0xff273085),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Center(
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                    ),
                                    child: Transform.rotate(
                                      angle: 90 * pi / 180,
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xff273085),
                                      ),
                                    ),
                                  ),
                                  items: professions
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ).copyWith(left: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "$e ",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color:
                                                        const Color(0xff273085),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (selection) {
                                    setState(() {
                                      selectedProfession=selection!;
                                    });
                                  },
                                  value: selectedProfession,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RoundedButton(
                        text: "Enregistrer",
                        backgroundColor:
                            const Color(0xff1331C4).withOpacity(0.5),
                        strokeColor: Colors.transparent,
                        txtColor: Colors.white,
                        onPressed: () async {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ResponsiveLayout(
                                mobileScreenLayout: MobileScreenLayout(),
                                webScreenLayout: WebScreenLayout(),
                              ),
                            ),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
