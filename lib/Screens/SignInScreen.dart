import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysaiph/Screens/ForgetPasswordScreen.dart';
import 'package:mysaiph/Screens/UpdateUserScreen.dart';
import 'package:mysaiph/Screens/user_formulaire_one.dart';
import 'package:mysaiph/models/user.dart';
import 'package:mysaiph/resources/auth-methode.dart';
import 'package:mysaiph/responsive/responsive_layout_screen.dart';
import 'package:mysaiph/responsive/mobile_screen_layout.dart';
import 'package:mysaiph/responsive/web_screen_layout.dart';
import 'package:mysaiph/utils/utils.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethodes().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'success') {
      print('here!!!!');
      debugPrint(_emailController.text);
      User loggedInUser = await getUserDetailsByEmail(_emailController.text);

      if (context.mounted) {
        if (loggedInUser.Verified == "0") {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserFormulaireOne(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              ),
            ),
          );
        }

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 350;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 1050 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/backgroundSignin.png'),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 32.7479248047 * fem,
                left: (MediaQuery.of(context).size.width - (180.78 * fem)) / 2,
                child: Align(
                  child: SizedBox(
                    width: 180.78 * fem,
                    height: 70.81 * fem,
                    child: Image.asset(
                      'assets/accroche-adol-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  width: 280 * fem,
                  height: 270 * fem,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Email Input Field


                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Utilisateur',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Identifiant';
                        }
                        return null;
                      },
                    ),
                        SizedBox(height: 16),
                        // Password Input Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isPasswordObscured,
                          decoration: InputDecoration(
                            hintText: 'Mot de passe',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Mot de passe';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordPage(),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 120.0), // Adjust left padding as needed
                              child: Text(
                                'Mot de passe oublié ?',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Inter',
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24),
                        // Sign In Button
                        Container(
                          width: 120 * fem,
                          child: ElevatedButton(

                            onPressed: () {
                              loginUser();

                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff273085), // Change to your desired blue color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50 * fem),
                              ),
                              elevation: 2 * fem,
                            ),

                            child: !_isLoading
                                ? const Text(
                              'Connecter',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                            )
                                : CircularProgressIndicator(
                              color: Colors.blue,

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<User> getUserDetailsByEmail(String email) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return User.fromSnap(querySnapshot.docs[0]);
  } else {
    throw Exception("User not found");
  }
}
