import 'package:academy_lms/Auth/SignIn/auth.dart';
import 'package:academy_lms/Auth/SignIn/phone_auth.dart';
import 'package:academy_lms/Auth/SignUp/sign_up.dart';
import 'package:academy_lms/Components/custombutton.dart';
import 'package:academy_lms/Home/home.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadedSlideAnimation(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'Assets/sample_logo.png',
              scale: 2.5,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Sign in with Google',
              onTap: () {
                authClass.googleSignIn(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Continue with Phone Number",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneAuthPage()));
              },
            ),
            // colorButton(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you don't have an Account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => SignUpUI()),
                        (route) => false);
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  // Widget colorButton() {
  //   return InkWell(
  //     onTap: () async {
  //       try {
  //         firebase_auth.UserCredential userCredential =
  //             await firebaseAuth.signInWithEmailAndPassword(
  //                 email: _emailController.text, password: _pwdController.text);
  //         print(userCredential.user!.email);
  //         setState(() {
  //           circular = false;
  //         });
  //         Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (builder) => HomePage()),
  //             (route) => false);
  //       } catch (e) {
  //         final snackbar = SnackBar(content: Text(e.toString()));
  //         ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //         setState(() {
  //           circular = false;
  //         });
  //       }
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width - 100,
  //       height: 60,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         gradient: LinearGradient(colors: [
  //           Color(0xfffd746c),
  //           Color(0xffff9068),
  //           Color(0xfffd746c)
  //         ]),
  //       ),
  //       child: Center(
  //         child: circular
  //             ? CircularProgressIndicator()
  //             : Text(
  //                 "Sign In",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 20,
  //                 ),
  //               ),
  //       ),
  //     ),
  //   );
  // }

  // Widget buttonItem(
  //     String imagepath, String buttonName, double size, Function onTap) {
  //   return InkWell(
  //     onTap: onTap(),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width - 60,
  //       height: 60,
  //       child: Card(
  //         color: Colors.black,
  //         elevation: 8,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           side: BorderSide(
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SvgPicture.asset(
  //               imagepath,
  //               height: size,
  //               width: size,
  //             ),
  //             SizedBox(
  //               width: 15,
  //             ),
  //             Text(
  //               buttonName,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 17,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget textItem(
  //     String labeltext, TextEditingController controller, bool obscureText) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width - 70,
  //     height: 55,
  //     child: TextFormField(
  //       controller: controller,
  //       obscureText: obscureText,
  //       style: TextStyle(
  //         fontSize: 17,
  //         color: Colors.white,
  //       ),
  //       decoration: InputDecoration(
  //         labelText: labeltext,
  //         labelStyle: TextStyle(
  //           fontSize: 17,
  //           color: Colors.white,
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: BorderSide(
  //             width: 1.5,
  //             color: Colors.amber,
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: BorderSide(
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
