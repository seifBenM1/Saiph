import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mysaiph/Screens/display_notif.dart';
import 'package:mysaiph/Screens/profile_screen.dart';
import 'package:mysaiph/Screens/search_screen.dart';
import 'package:mysaiph/widgets/profile_container.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileContainer(
                body: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: ()=> Navigator.of(context).push( MaterialPageRoute(builder: (context)=>ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),),),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(userProvider.getUser.photoUrl),
                            radius: 80, // Adjust the radius to your desired size
                          ),
                          Positioned(
                            bottom: 0,
                            right: 20,
                            child: Image.asset(
                              "assets/images/editpic.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          userProvider.getUser.pseudo,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    ProfileButton(
                      screenWidth,
                      "Notifications",
                      Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                          color: Color(0xFFA90008),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                          () {
                        // Navigate to the home page when the button is clicked
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotifPopup(),
                            ));
                      },
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    ProfileButton(
                      screenWidth,
                      "Amis",
                      const SizedBox(),
                          () {
                        // Navigate to the profile screen when "Amis" button is pressed
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                      },
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    ProfileButton(
                        screenWidth,
                        "Transfert de points",
                        Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                            () {}),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileButton(
                        screenWidth, "Déconnexion", const SizedBox(), () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget ProfileButton(
    double width, String text, Widget ending, VoidCallback function) {
  return SizedBox(
    width: width,
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        primary: Color(0xff273085),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ending
        ],
      ),
    ),
  );
}
