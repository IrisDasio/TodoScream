import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/constants/font_color.dart';

import '../../constants/assets.dart';
import '../../items/background_image/bg_image2.dart';
import '../../items/login/login_input_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailInput = "";
  String pwInput = "";
  bool isBtnEnable = false;

  checkInput() {
    setState(() {
      isBtnEnable = emailInput.isNotEmpty && pwInput.isNotEmpty;
    });
  }

  handleCheckEmailChange(String text) {
    setState(() {
      emailInput = text;
      checkInput();
    });
  }

  handleCheckPasswordChange(String text) {
    setState(() {
      pwInput = text;
      checkInput();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage2(),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      width: 240,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.welcomeTitleImage),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        LoginInputTextField(
                          hintText: "이메일",
                          obscureText: false,
                          onChanged: handleCheckEmailChange,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        LoginInputTextField(
                          hintText: "비밀번호",
                          obscureText: true,
                          onChanged: handleCheckPasswordChange,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isBtnEnable == true ? () {} : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FontColor.subColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              32,
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text("로그인"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("계정이 없으신가요?"),
                        SizedBox(
                          width: 12,
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: FontColor.subColor,
                            ),
                            "회원가입",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
