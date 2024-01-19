import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mysaiph/Screens/Quiz/Quiz_screen.dart';
import 'package:mysaiph/Screens/QuizCultureGeneral/Quiz_screen.dart';
import 'package:mysaiph/flappybird/main.dart';

import 'Games/game_main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
    child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'JEUX', // Add your desired text
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF054275)),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 250,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 0.75,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                reverse: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                buildCarouselItem('assets/images/talaani.png', '', () { Navigator.push(context, MaterialPageRoute(builder: (context) =>  FlappyBirdApp()),);},
                0
            ),
                buildCarouselItem(
                  'assets/adolyPuzzle.png',
                  '',
                  () { Navigator.push(context, MaterialPageRoute(builder: (context) => const GameMainMenu(title: 'PUZZLE',)),);},
                  0
                ),
                buildCarouselItem(
                    'assets/images/dawini_bg.png',
                    '',
                    () { Navigator.push(context, MaterialPageRoute(builder: (context) => const GameMainMenu(title: 'JEU DE MÉMOIRE',)),);},
                  0
                ),
                buildCarouselItem('assets/images/sawarni.png', '', (){}, 0),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'QUIZ', // Add your desired text
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF054275)),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 250,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 0.75,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [

                buildCarouselItem(
                    'assets/quiz.png',
                    'Quiz 1',
                    () { Navigator.push(context, MaterialPageRoute(builder: (context) => QuizgameScreen()),);},
                    0.3
                ),
                buildCarouselItem(
                    'assets/quiz1.png',
                    'Quiz 2',
                    () { Navigator.push(context, MaterialPageRoute(builder: (context) => QuizClutureGenerale()),);},
                    0.3
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget buildCarouselItem(String imagePath, String title,VoidCallback onPressed, double overlayOpacity) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(overlayOpacity),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }

}
