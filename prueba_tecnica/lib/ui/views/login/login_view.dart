import 'package:prueba_tecnica/ui/views/home/home_screen.dart';

import 'package:prueba_tecnica/Constants/colors.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/principal.jpeg'),
                  fit: BoxFit.cover)),
          // ignore: prefer_const_constructors
          child: ListView(padding: EdgeInsets.zero, children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 90, bottom: 350),
                    child: const Text('Welcome!',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: ColorsConstant.cuartoColor,
                            fontSize: 40,
                            letterSpacing: 0.5)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120, right: 10, left: 10),
                child: Container(
                  child: const Text("Sign up", style: TextStyle(fontSize: 20.0)),
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: ColorsConstant.cuartoColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 10, left: 10),
                child: Container(
                  child:
                      const Text("Log in", style: TextStyle(fontSize: 20.0)),
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: ColorsConstant.primerColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                  padding: const EdgeInsets.only(bottom: 0.1),
                  // ignore: prefer_const_constructors
                  child: Text("Forgot password?",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: ColorsConstant.cuartoColor,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5)))
            ])
          ]),
        ),
      ),
    );
  }
}
