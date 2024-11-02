// ../../washking/washking/lib/pages/auth/sign_in.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/components/button.dart';
import 'package:monitor_me/components/text_field.dart';
import 'package:monitor_me/pages/admin/home.dart';
import 'package:monitor_me/pages/user/home.dart';
import 'package:monitor_me/services/transitions.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user input
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  // final bool _isPinVisible = false;

  // Fade In Animation
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> formSlideAnimation;
  late AnimationController animationController;
  // late AnimationController fastAnimationController;

  @override
  void initState() {
    super.initState();
    // fastAnimationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 5000),
    // );
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // fastAnimationController.forward();
    // fastAnimationController.addStatusListener(
    //   (status) {
    //     if (status == AnimationStatus.completed) {
    //       fastAnimationController.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       fastAnimationController.forward();
    //     }
    //   },
    // );

    // fastAnimationController.repeat();
    // fastAnimationController.duration = Duration(seconds: 2);
    logoFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    formSlideAnimation = Tween<Offset>(begin: Offset(1, 1), end: Offset.zero)
        .animate(animationController);

    // fastAnimationController.forward();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    // fastAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   forceMaterialTransparency: true,
      //   // backgroundColor: Colors.transparent,
      //   // shadowColor: Colors.transparent,
      //   // surfaceTintColor: Colors.transparent,
      // ),
      body: FadeTransition(
        opacity: logoFadeAnimation,
        child: SafeArea(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Center(
              child: Form(
                  key: _formKey,
                  child: Container(
                    // color: Colors.amber,
                    constraints: BoxConstraints(
                      maxWidth: 500,
                      minWidth: 300,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // duration: Duration(seconds: 1),
                            height: 0.2 * MediaQuery.sizeOf(context).height,
                            constraints: BoxConstraints(minHeight: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.monitor_heart,
                                  size: 0.2 * MediaQuery.sizeOf(context).height,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "MonitorMe",
                            style: GoogleFonts.bebasNeue(fontSize: 30),
                          ),
                          //     Image.asset("assets/sonmit-transparent.png"),
                          const SizedBox(height: 25),
                          // ThemeSwitch(),
                          // CODE
                          FormTextField(
                            prefixIcon: Icon(Icons.email),
                            controller: _codeController,
                            hintText: "ID",
                            // keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 25),
                          // PIN
                          FormTextField(
                            prefixIcon: Icon(Icons.password),
                            controller: _pinController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            hassuffixIcon: true,
                            hintText: "Pin",
                            maxLength: 6,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // validator: (value) {
                            //   if (value == "0000") {
                            //     return "false";
                            //   }
                            // },
                            // keyboardType: TextInputType.datetime,
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text("Don't have an account? "),
                              GestureDetector(
                                  onTap: () => Navigator.pushReplacement(
                                      context, fadeInTransition(HomePage())),
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 25),
                          FullButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final code = _codeController.text.trim();
                                final pin = _pinController.text.trim();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Logging in with code: $code pin:$pin')));
                                        if(pin == '0000') {
                                          Navigator.pushReplacement(
                                    context, blurTransition(AdminHomePage()));
                                        } else {
                                          Navigator.pushReplacement(
                                    context, blurTransition(HomePage()));
                                        }
                              }
                            },
                            text: "Login",
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
      // )
    );
  }
}
