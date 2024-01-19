import 'package:flutter/material.dart';

import 'GiftsScreen.dart';



class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {

    final double baseWidth = 380;
    final double scalingFactor = MediaQuery.of(context).size.width / baseWidth;
    final double fontSizeFactor = scalingFactor * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              height: 570 * scalingFactor,
              child: Stack(
                children: [
                  Positioned(
                    left: 23 * scalingFactor,
                    top: 10, // Set top to 0 to remove the space
                    child: Align(
                      child: Text(
                        'Points et Cadeaux',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16 * fontSizeFactor,
                          color: Color(0xff273085),
                        ),
                      ),
                    ),
                  ),


                  Positioned(
                    left: 150 * scalingFactor,
                    top: 80 * scalingFactor,
                    child: Align(
                      child: Text(
                        'Vous avez',
                        style: TextStyle(
                          fontSize: 16 * fontSizeFactor,
                          color: Color(0xff273085),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100 * scalingFactor,
                    top: 100 * scalingFactor,
                    child: Align(
                      child: Text(
                        '1000 Points',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30 * fontSizeFactor,
                          color: Color(0xff273085),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                  // Other Positioned widgets...

                  Positioned(
                    left: 36 * scalingFactor,
                    top: 503 * scalingFactor,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Gift2(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50 * scalingFactor),
                        ),
                        primary: Color(0xff273085),
                        shadowColor: Colors.grey.withOpacity(0.5),
                      ),
                      child: Container(
                        width: 307.17 * scalingFactor,
                        height: 54 * scalingFactor,
                        child: Center(
                          child: Text(
                            'Transformez en cadeaux',
                            style: TextStyle(
                              fontSize: 16 * fontSizeFactor,
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0 * scalingFactor,
                    top: 175 * scalingFactor,
                    child: Container(
                      width: 338 * scalingFactor,
                      height: 292 * scalingFactor,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0 * scalingFactor,
                            top: 0 * scalingFactor,
                            child: Align(
                              child: SizedBox(
                                width: 332 * scalingFactor,
                                height: 266 * scalingFactor,
                                child: Image.asset(
                                  'assets/rectangle-14.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 127 * scalingFactor,
                            top: 170 * scalingFactor,
                            child: Align(
                              child: SizedBox(
                                width: 133 * scalingFactor,
                                height: 122 * scalingFactor,
                                child: Image.asset(
                                  'assets/rectangle-15.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 211 * scalingFactor,
                            top: 121 * scalingFactor,
                            child: Align(
                              child: SizedBox(
                                width: 122 * scalingFactor,
                                height: 150 * scalingFactor,
                                child: Image.asset(
                                  'assets/rectangle-16.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
