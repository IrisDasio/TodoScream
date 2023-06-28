import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/common/components/background_img.dart';
import 'package:flutter_application_todo_scream/common/components/custom_elevated_button.dart';
import 'package:flutter_application_todo_scream/common/components/loging_signup_text_form_field.dart';
import 'package:flutter_application_todo_scream/common/components/page_change_button.dart';
import 'package:flutter_application_todo_scream/constants/assets.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';
import 'package:flutter_application_todo_scream/pages/login_page/login_view.dart';
import 'package:flutter_application_todo_scream/pages/terms_page/terms_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String emailInput = "";
  String pwInput = "";
  String rePwInput = "";
  bool isBtnEnable = false;

  final formKey = GlobalKey<FormState>();

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

  handleCheckReconfirmPasswordChange(String text) {
    setState(() {
      rePwInput = text;
      checkInput();
    });
  }

  String? validateEmail(String? email) {
    RegExp emailRegExp = RegExp(
      r'^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,6})$',
    );
    if (emailInput.isEmpty) {
      return null;
    }

    if (!emailRegExp.hasMatch(emailInput)) {
      return "올바른 이메일 양식이 아닙니다.";
    }

    return null;
  }

  String? validatePw(String? pw) {
    bool isPwValid = pwInput.length >= 8 && pwInput.length <= 20;
    if (pwInput.isEmpty) {
      return null;
    }

    if (!isPwValid) {
      return "비밀번호는 8자 이상, 20자 미만으로 해주세요.";
    }

    return null;
  }

  String? validateReconfirmPw(String? pw) {
    if (pwInput.isEmpty) {
      return null;
    }

    if (pwInput != rePwInput) {
      return "비밀번호와 일치하지 않습니다.";
    }

    return null;
  }

  checkInput() {
    setState(() {
      isBtnEnable = validateEmail(emailInput) == null &&
          validatePw(pwInput) == null &&
          validateReconfirmPw(rePwInput) == null;
    });
  }

  handlePageChangeLogin() {
    navigateToPage(
      context,
      const LoginPage(),
    );
  }

  handlePageChangeTerms() {
    if (formKey.currentState?.validate() ?? false) {
      navigateToPage(context, const TermsPage());
    }
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 240,
                          width: 240,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.createAccountImage),
                            ),
                          ),
                        ),
                        SignUpInTextFormField(
                          labelText: "이메일",
                          obscureText: false,
                          onChanged: handleCheckEmailChange,
                          validator: validateEmail,
                        ),
                        SignUpInTextFormField(
                          labelText: "비밀번호",
                          obscureText: true,
                          onChanged: handleCheckPasswordChange,
                          validator: validatePw,
                        ),
                        SignUpInTextFormField(
                          labelText: "비밀번호 확인",
                          obscureText: true,
                          onChanged: handleCheckReconfirmPasswordChange,
                          validator: validateReconfirmPw,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                          onPressed: isBtnEnable == true
                              ? handlePageChangeTerms
                              : null,
                          text: "다음 단계로",
                        )
                      ],
                    ),
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
                  const Text("이미 계정이 있으신가요?"),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(
                    onPressed: handlePageChangeLogin,
                    child: const Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.subColor,
                      ),
                      "로그인",
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
