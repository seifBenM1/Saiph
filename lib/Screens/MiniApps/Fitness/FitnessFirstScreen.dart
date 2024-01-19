import 'package:flutter/material.dart';

class FitnessFirstScreen extends StatefulWidget {
  @override
  _FitnessFirstScreenState createState() => _FitnessFirstScreenState();
}

class _FitnessFirstScreenState extends State<FitnessFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 1050,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fitness.jpg'),
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Welcome to\nFitness First',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Marope',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 60,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.7
                      ..color = Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
