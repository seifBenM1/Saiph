import 'dart:math';

import 'package:flutter/material.dart';

import '../../Models/puzzle_game/level.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/game_widgets/container_wooden.dart';
import '../../widgets/game_widgets/game_top_bar.dart';
import '../../widgets/game_widgets/level_button.dart';
import '../../widgets/game_widgets/up_to_down.dart';
import '../../widgets/game_widgets/user_header.dart';


class LevelsScreen extends StatefulWidget {
  final String fullname;
  final bool showDifficulty;
  final int score;
  final List<Widget> levelsDescription;

  const LevelsScreen({super.key,
    required this.fullname,
    required this.showDifficulty,
    required this.score,
    required this.levelsDescription,
  });

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();


}

class _LevelsScreenState extends State<LevelsScreen> {
  Color dropdownColor= CustomColors.green;
  String selectedDiff= "Facile";
  @override
  Widget build(BuildContext context) {
    //get user game details (score/level/difficulty) + username and pic

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        body: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColors.lightBlue,
                CustomColors.blueGradient,
                CustomColors.lightBlue,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  GameTopBar(title: 'NIVEAUX',
                      onPressedClose: (){
                        Navigator.of(context).pop();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: UserHeader(
                      image: 'assets/images/profile_pic.png',
                      fullname: widget.fullname,
                      score: widget.score,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: CustomColors.lightGray.withOpacity(0.40),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const Padding(
                              padding:  EdgeInsets.only(bottom: 5,),
                              child: Text(
                                "Classement",
                                style:  TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.darkBlue,
                                ),
                              ),
                            ),
                            rankingItem(context, false),
                            const SizedBox(
                              height: 5,
                            ),
                            rankingItem(context, true),
                            const SizedBox(
                              height: 5,
                            ),
                            rankingItem(context, false),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: widget.showDifficulty,
                    child: Center(
                      child: Container(
                        width: screenWidth/2,
                        decoration: BoxDecoration(
                          color: dropdownColor,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: CustomColors.darkBlue,
                            width: 2,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            //  itemHeight: screenWidth/4,
                            dropdownColor: (dropdownColor).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30),
                            icon: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Transform.rotate(
                                angle: 90 * pi / 180,
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: CustomColors.darkBlue,
                                ),
                              ),
                            ),
                            items: [
                              "Facile",
                              "Moyen",
                              "Difficile",
                            ]
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
                                            style: const  TextStyle(
                                              color: CustomColors.darkBlue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (selection) {
                              if(!selection!.contains(selectedDiff)){
                                if(selection.contains("Facile")){
                                  setState(() {
                                    selectedDiff="Facile";
                                    dropdownColor=CustomColors.green;

                                  });
                                }else if(selection.contains("Moyen")){
                                  setState(() {
                                    selectedDiff="Moyen";
                                    dropdownColor=CustomColors.orange;

                                  });
                                }
                                else{
                                  setState(() {
                                    selectedDiff="Difficile";
                                    dropdownColor=CustomColors.redPrimary;

                                  });
                                }
                              }
                            },
                            value: selectedDiff,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: WoodenContainer(
                      child: Align(
                        alignment: Alignment.center,
                        child: IntrinsicWidth(
                          child: Column(children: [
                            for (var i = 0; i < widget.levelsDescription.length; i++)
                              Column(
                                children: [
                                  LevelButton(
                                      text: "Niveau ${i + 1}",
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => displayInfoDialog(
                                              context,
                                              "Niveau ${i + 1}",
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: widget.levelsDescription[i],
                                              )
                                              // levelsDescription[i],

                                              ),
                                        );
                                      },
                                      isLocked: widget.showDifficulty?true:Level().getLevels()[i].score!>widget.score),
                                  if (i < widget.levelsDescription.length - 1 &&
                                      widget.levelsDescription.length != 1)
                                    const SizedBox(height: 10)
                                ],
                              )
                          ]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rankingItem(BuildContext context, bool isCurrentUser) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: isCurrentUser?12:10, vertical: isCurrentUser?9:7),
      width: double.maxFinite,
      margin:  EdgeInsets.symmetric(horizontal: isCurrentUser?10:20),
      decoration: BoxDecoration(
          color: isCurrentUser?CustomColors.darkBlue:CustomColors.yellow,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: CustomColors.darkBlue,
            width: 1,
          )),
      child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      "232",
                      style:  TextStyle(
                        fontSize: isCurrentUser?12:11,
                        fontWeight: FontWeight.w600,
                        color: isCurrentUser?Colors.white:CustomColors.darkBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      radius: isCurrentUser?17:15,
                      child: Image.asset('assets/images/profile_pic.png'),
                    ),
                  ),
                  Text(
                    widget.fullname,
                    style:  TextStyle(
                      fontSize: isCurrentUser?12:11,
                      fontWeight: FontWeight.w600,
                      color: isCurrentUser?Colors.white:CustomColors.darkBlue,
                    ),
                  )
                ],
              ),
              Text(
                "${widget.score} pts",
                style:  TextStyle(
                  fontSize: isCurrentUser?12:11,
                  fontWeight: FontWeight.w600,
                  color: isCurrentUser?Colors.white:CustomColors.darkBlue,
                ),
              ),
            ],
          )),
    );
  }

  Widget displayInfoDialog(BuildContext context, String title, Widget body) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: UpToDown(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: CustomColors.lightBlue,
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/wood_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              width: width / 1.2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                    child: body,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
