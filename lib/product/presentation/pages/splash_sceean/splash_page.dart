import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/helper_ex.dart';
import '../../../../core/style_app/num_app.dart';
import '../../../../core/style_app/string_app.dart';
import '../home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  Timer? _timer;

  _getTimer() {
    _timer = Timer(
        const Duration(
          seconds: NumApp.num5,
        ),
        _getNavigator);
  }

  void _getNavigator() {
    context.navReplacement(const HomePage());
  }

  @override
  void initState() {
    _getTimer();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: NumApp.num3));
    animation = Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    setState(() {
      animationController.addListener(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: NumApp.num200,
                    left: NumApp.num20,
                    right: NumApp.num20),
                child: SizedBox(
                  height: NumApp.num370,
                  child: Center(
                      child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget? child) {
                          return SlideTransition(
                            position: animation,
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: NumApp.num100,
                              backgroundImage: CachedNetworkImageProvider(
                                'https://th.bing.com/th/id/R.441cbde0000103390b102816ecc4a2dc?rik=BfEswAh5uZY9pw&pid=ImgRaw&r=0',
                              ),
                            ),
                          );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            right: NumApp.num15,
                            top: NumApp.num15,
                            bottom: NumApp.num20),
                        child: Text(
                          StringApp.nameSplash,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: NumApp.num20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    animationController.dispose();
    super.dispose();
  }
}
