import 'package:flutter/material.dart';

import '../../Models/memory_game.dart';
import '../../Models/memory_game/enums/game_difficulty.dart';
import '../../controllers/memory_game_contoller.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/game_widgets/container_wooden.dart';
import '../../widgets/game_widgets/level_description_dialog_body.dart';
import '../../widgets/game_widgets/rounded_button.dart';
import '../../widgets/game_widgets/user_header.dart';
import 'Dawini/memory_game_board.dart';
import 'Puzzle/puzzle_game_screen.dart';
import 'game_levels_screen.dart';

class GameMainMenu extends StatefulWidget {
  final String title;

  const GameMainMenu({super.key, required this.title});

  @override
  State<GameMainMenu> createState() => _GameMainMenuState();
}

class _GameMainMenuState extends State<GameMainMenu> {
  final String userEmail="meriam@gmail.com"; //to change
  String username="";
  String gameId="";
  int userScore = 0;
  int userLevel = 1;
  String gameDifficulty = '';
  late bool isCompleted;


  final MemoryGameController _gameController = MemoryGameController();

  @override
  void initState() {
    super.initState();
    if(widget.title.toLowerCase()!='puzzle') {
      fetchMemoryGameScore(userEmail);
    }
    fetchUserPseudo(userEmail);
  }

  Future<void> fetchMemoryGameScore(String userEmail) async {
    Stream<MemoryGame?> gameStream = _gameController.getGameByUser(userEmail);
    gameStream.listen((MemoryGame? game) async {
      if (game != null) {
        setState(() {
          userScore = game.score;
          userLevel=game.level;
          gameDifficulty=game.difficulty;
          isCompleted=game.completed;
        });
      }else{
        await _gameController.createUserGame(userEmail);
        fetchMemoryGameScore(userEmail);
      }
    });
  }

  Future<void> fetchUserPseudo(String userEmail) async {
    String? fetchedUsername = await _gameController.getPseudoByEmail(userEmail);
    if (fetchedUsername != null) {
      setState(() {
        username=fetchedUsername;
      });
    }else{
    }
  }

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

            /*child: FutureBuilder(
              future: PuzzleGameService().getUser(userId),
              builder:(BuildContext context, AsyncSnapshot<User> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: LoadingIndicator(indicatorType: Indicator.pacman,colors: [Colors.white],));
                }
                else if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }
                else if (!snapshot.hasData){
                  return Text('User not found');
                }
                else{
                  username=snapshot.data!.firstname;
                  score=snapshot.data!.score;
                  return SingleChildScrollView(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GameTopBar(
                                title: '',
                                onPressedClose: () {
                                  Navigator.of(context).pop();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                             UserHeader(
                              image: 'assets/images/profile_pic.png',
                              fullname: username,
                              score: score,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: !title.contains("PUZZLE")
                                    ? Image.asset(
                                  'assets/images/dawini.png',
                                  width: screenWidth * 0.9,
                                )
                                    : Image.asset(
                                  'assets/images/puzzle.png',
                                  width: screenWidth * 0.8,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: CustomColors.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: WoodenContainer(
                          child: Align(
                            alignment: Alignment.center,
                            child: IntrinsicWidth(
                              child: gameButtons(context, username, score),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ));
                }
              },
            ),*/
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserHeader(
                      image: 'assets/images/profile_pic.png',
                      fullname: username,
                      score: userScore,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: !widget.title.contains("PUZZLE")
                            ? Image.asset(
                          'assets/images/dawini.png',
                          width: screenWidth * 0.9,
                        )
                            : Image.asset(
                          'assets/images/puzzle.png',
                          width: screenWidth * 0.8,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: CustomColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: WoodenContainer(
                  child: Align(
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: gameButtons(context, username, userScore),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
          ),
        ),
      );

  }

  Widget gameButtons(BuildContext context, String fullname, int score) {
    return Column(
      children: [
        RoundedButton(
          text: 'JOUER',
          backgroundColor: CustomColors.redPrimary,
          strokeColor: CustomColors.lightBlue,
          txtColor: Colors.white,
          onPressed: () {
            if (widget.title.contains("PUZZLE")) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => PuzzleGameScreen(
                        fullname: fullname,
                        score: score,
                      )));
            } else {
              if(isCompleted){
                _showGameFinishedSnackbar(context);
              }else{
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MemoryGameBoard(
                      fullname: fullname,
                    )));
              }
            }
          },
        ),
        const SizedBox(height: 20),
        RoundedButton(
          text: 'NIVEAUX',
          backgroundColor: CustomColors.orange,
          strokeColor: CustomColors.lightBlue,
          txtColor: Colors.white,
          onPressed: () {
            if (widget.title.contains("PUZZLE")) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LevelsScreen(
                        fullname: fullname,
                        showDifficulty: false,
                        score: score,
                        levelsDescription: const [
                          LevelInfoBody(rules: [
                            MapEntry("< 2 min", 30),
                            MapEntry("> 2 min et < 5 min", 20),
                            MapEntry("> 5 min", 10),
                          ]),
                          LevelInfoBody(rules: [
                            MapEntry("< 5 min", 40),
                            MapEntry("> 5 min et < 10 min", 30),
                            MapEntry("> 10 min", 20),
                          ]),
                          LevelInfoBody(rules: [
                            MapEntry("< 10 min", 50),
                            MapEntry("> 10 min et < 20 min", 40),
                            MapEntry("> 20 min", 30),
                          ])
                        ],
                      )));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LevelsScreen(
                        fullname: fullname,
                        showDifficulty: true,
                        score: score,
                        levelsDescription: const [
                          LevelInfoBody(rules: [
                            MapEntry("< 29s", 100),
                            MapEntry("< 13s", 150),
                          ]),
                          LevelInfoBody(rules: [
                            MapEntry("< 37", 200),
                            MapEntry("< 19s", 300),
                          ]),
                          LevelInfoBody(rules: [
                            MapEntry("< 61", 300),
                            MapEntry("< 31s", 450),
                          ]),
                          LevelInfoBody(rules: [
                            MapEntry("< 71s", 400),
                            MapEntry("< 36s", 600),
                          ]),
                          LevelInfoBody(rules: [
                            MapEntry("< 100s", 500),
                            MapEntry("< 51s", 750),
                          ])
                        ],
                      )));
            }
          },
        ),
        const SizedBox(height: 20),
        RoundedButton(
          text: 'QUITTER',
          backgroundColor: Colors.white,
          strokeColor: CustomColors.lightBlue,
          txtColor: CustomColors.darkBlue,
          onPressed: () {
           Navigator.pop(context);

          },
        ),
      ],
    );
  }

  void _showGameFinishedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Vous avez déjà terminé le jeu !"),
        duration: Duration(seconds: 3), // Adjust the duration as needed
        backgroundColor: Colors.green,
      ),
    );
  }

}
