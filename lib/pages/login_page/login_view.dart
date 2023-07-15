import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/common/components/background_img.dart';
import 'package:flutter_application_todo_scream/common/components/custom_elevated_button.dart';
import 'package:flutter_application_todo_scream/common/components/loging_signup_text_form_field.dart';
import 'package:flutter_application_todo_scream/common/components/page_change_button.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';
import 'package:flutter_application_todo_scream/pages/home_page/home_view.dart';
import 'package:flutter_application_todo_scream/pages/sign_up_page/sign_up_view.dart';

import '../../constants/assets.dart';

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

  handlePageChangeSignUp() {
    navigateToPage(
      context,
      const SignUpPage(),
    );
  }

  handlePageChangeHome() {
    navigateToPage(
      context,
      const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Column(
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
                          SignUpInTextFormField(
                            labelText: "이메일",
                            obscureText: false,
                            onChanged: handleCheckEmailChange,
                          ),
                          SignUpInTextFormField(
                            labelText: "비밀번호",
                            obscureText: true,
                            onChanged: handleCheckPasswordChange,
                          ),
                          CustomElevatedButton(
                            onPressed:
                                isBtnEnable ? handlePageChangeHome : null,
                            text: "로그인",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("계정이 없으신가요?"),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(
                    onPressed: handlePageChangeSignUp,
                    child: const Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.subColor,
                      ),
                      "회원가입",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
