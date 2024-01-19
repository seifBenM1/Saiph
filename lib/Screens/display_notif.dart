import 'package:flutter/material.dart';

class NotifPopup extends StatefulWidget {
  const NotifPopup({super.key});

  @override
  State<NotifPopup> createState() => _NotifPopupState();
}

class _NotifPopupState extends State<NotifPopup> {

  int selectedIndex = -1;
  List<String> answersList = ["Chat","Chien","Lapins","Furets"];
  String _selectedAnswer = "";
  late double screenWidth;
  late double fontSizeFactor;
  double baseWidth = 380;
  @override
  Widget build(BuildContext context) {
    final double scalingFactor = MediaQuery.of(context).size.width / baseWidth;
    fontSizeFactor = scalingFactor * 0.97;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Quel est votre animal préféré ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24*fontSizeFactor,
                    color: const Color(0xff273085),
                  ),
                ),
                buildAnswerItems(),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50 * scalingFactor),
                    ),
                    primary: const Color(0xff273085),
                    shadowColor: Colors.grey.withOpacity(0.5),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    width: screenWidth/2,
                    child: Center(
                      child: Text(
                        'Envoyer',
                        style: TextStyle(
                          fontSize: 16 * fontSizeFactor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }

  Widget buildAnswerItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: List.generate(answersList.length, (index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                _selectedAnswer = answersList[selectedIndex];
              });
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(3, 0, 3, 30),
              padding: const EdgeInsets.fromLTRB(25, 17, 25, 17),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff273085) : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xff273085),
                  width: isSelected ? 0.0 : 2.0,
                ),
              ),
              child: Container(
                width: screenWidth/2,
                child: Text(
                  answersList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15*fontSizeFactor,
                    color: isSelected ? Colors.white : const Color(0xff273085),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
