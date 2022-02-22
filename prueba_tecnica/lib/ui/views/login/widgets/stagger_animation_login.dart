import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Constants/colors.dart';

class StaggerAnimationLogin extends StatelessWidget {

  late final AnimationController controller;

  StaggerAnimationLogin({required this.controller}) :
      buttonSqueeze = Tween(
        begin: 320.0,
        end: 60.0
      ).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150)
        )
      ),
      buttonZoomOut = Tween(
        begin: 60.0,
        end: 1000.0
      ).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1)//, curve: Curves.bounceInOut)
        )
      );

  late final Animation<double> buttonSqueeze;
  late final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child){
    return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: InkWell(
          onTap: (){
            controller.forward();
          },
          child: Hero(
            tag: "fade",
            child:
            buttonZoomOut.value <= 60 ?
            Container(
                width: buttonSqueeze.value,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: ColorsConstant.primerColor,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                //child: _buildInside(context)
            ) :
            Container(
              width: buttonSqueeze.value,
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: ColorsConstant.terceColor,
                  borderRadius: BorderRadius.all(Radius.circular((30.0))),
              ),
            ),
          )
        ),
    );
  }

  // Widget _buildInside(BuildContext context){
  //   if(buttonSqueeze.value > 75){
  //     return const Text('Sign up',
  //       style: TextStyle(
  //           color: ColorsConstant.segundoColor,
  //           fontSize: 25,
  //           fontWeight: FontWeight.w300,
  //           letterSpacing: 0.3
  //       ),
  //     );
  //   } else {
  //     return const CircularProgressIndicator(
  //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  //       strokeWidth: 1.0,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation);
  }
}
