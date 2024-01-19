import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'dart:ui';




class Gift2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Points et Cadeaux',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xFF273085),


          ),

        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF273085),
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // cadeaux919 (200:274)
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // autogroupkletrgF (KMTkeMWcjV1NYDuhVmKLET)
                width: double.infinity,
                height: 663*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 330*fem,
                      height: 30*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // vousavezZj5 (200:278)
                            child: const Text(
                              'Vous avez:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'Inter',

                              ),

                            ),
                          ),
                          SizedBox(width: 10,),
                          const Text(
                            // pointsriB (200:281)
                            '1000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFF273085),
                            ),

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      // autogroupr6b1Tqh (KMTkNrxRx8aQBS61nZR6b1)
                      width: double.infinity,
                      height: 100*fem,
                      child: Stack(
                        children: [


                          Positioned(
                            // group16nmV (200:294)
                            left: 150*fem,
                            top: 0*fem,
                            child: Container(
                              width: 80*fem,
                              height: 99.11*fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle14Vvo (200:295)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 78.58*fem,
                                        height: 62.96*fem,
                                        child: Image.asset(
                                          'assets/rectangle-14-hMy.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // rectangle15aBZ (200:296)
                                    left: 31.2426757812*fem,
                                    top: 40.2366943359*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 31.48*fem,
                                        height: 28.88*fem,
                                        child: Image.asset(
                                          'assets/rectangle-15.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // rectangle16TWF (200:297)
                                    left: 51.1242675781*fem,
                                    top: 28.6390380859*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 28.88*fem,
                                        height: 35.5*fem,
                                        child: Image.asset(
                                          'assets/rectangle-16-qtK.png',
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
                    const SizedBox(height: 20,),
                    Container(
                      width: 307.17*fem,
                      height: 54*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff273085),
                        borderRadius: BorderRadius.circular(50*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Recharge téléphonique 1 DT...1000 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,


                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 307.17*fem,
                      height: 54*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff273085),
                        borderRadius: BorderRadius.circular(50*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Recharge téléphonique 1 DT...5000 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,

                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 307.17*fem,
                      height: 54*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff273085),
                        borderRadius: BorderRadius.circular(50*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Recharge téléphonique 1 DT...10 000 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 307.17*fem,
                      height: 54*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff273085),
                        borderRadius: BorderRadius.circular(50*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Bon d’achat 50 DT...50 000 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,

                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 307.17*fem,
                      height: 54*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff273085),
                        borderRadius: BorderRadius.circular(50*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Bon d’achat 100 DT...100 000 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: 307.17*fem,
                      height: 54*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff273085),
                        borderRadius: BorderRadius.circular(50*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Telephone...1 000 000 Points',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,

                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}