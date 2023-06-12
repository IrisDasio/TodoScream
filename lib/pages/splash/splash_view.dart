import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../constants/font_color.dart';
import '../../items/background_image/bg_image2.dart';
import '../login_page/login_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage2(),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                scale: 1.6,
                image: AssetImage(Assets.titleImage),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: FontColor.defaultColor,
                    fontSize: 16.0,
                  ),
                  "일상속 달콤한 선물",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
