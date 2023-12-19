import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

RxBool scecand = false.obs;

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        scecand.value = !scecand.value;
        //Get.to(otherScreen());
      }),
      body: Obx(() {
        return Stack(
          children: [
            AnimatedPositioned(
              top: scecand.value ? 123 : 138,
              left: scecand.value ? -96 : -46,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
              ),
            ),
            Positioned(
              top: 18,
              left: 314,
              child: Hero(
                tag: "Image2",
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
                ),
              ),
            ),
            Positioned(
              top: 211,
              left: 168,
              child: Hero(
                tag: "Image3",
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
                ),
              ),
            ),
            Positioned(
              top: 326,
              left: -71,
              child: Hero(
                tag: "Image4",
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class otherScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.back();
      }),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: 138,
            left: -46,
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
            ),
          ),
          Positioned(
            top: 284,
            left: 78,
            child: Hero(
              tag: "Image2",
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
              ),
            ),
          ),
          Positioned(
            top: 261,
            left: 108,
            child: Hero(
              tag: "Image3",
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
              ),
            ),
          ),
          Positioned(
            top: 386,
            left: -11,
            child: Hero(
              tag: "Image4",
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset("images/—Pngtree—football championship realistic soccer ball_5316695.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
