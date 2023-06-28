import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/common/components/background_img.dart';
import 'package:flutter_application_todo_scream/common/components/custom_elevated_button.dart';
import 'package:flutter_application_todo_scream/common/components/page_change_button.dart';
import 'package:flutter_application_todo_scream/common/components/terms_checkbox_item.dart';
import 'package:flutter_application_todo_scream/constants/assets.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';
import 'package:flutter_application_todo_scream/constants/term_list.dart';
import 'package:flutter_application_todo_scream/pages/login_page/login_view.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  List<bool> isCheckedTermId = List.generate(TermList.length, (index) => false);
  bool isAllChecked = false;
  List requiredTermsindex = [0, 1, 2];
  bool isBtnEnable = false;

  onCheckboxChanged(int index, bool checkedTermId) {
    setState(() {
      isCheckedTermId[index] = checkedTermId;
      isAllChecked = isCheckedTermId.every((checkedTermId) =>
          checkedTermId); //체크박스의 값(bool)들이 isAllChecked로 들어온다. if(){}else{}의 간결화
      requiredTermsChecked();
    });
  }

  allCheckedOnChange(bool? value) {
    setState(() {
      isAllChecked = value ?? false;
      isCheckedTermId =
          List.generate(TermList.length, (index) => value ?? false);
      requiredTermsChecked();
    });
  }

  requiredTermsChecked() {
    bool targetCheked =
        isCheckedTermId.sublist(0, 3).every((checkedTermId) => checkedTermId);

    setState(() {
      isBtnEnable = targetCheked;
    });
  }

  termTitle(int index) {
    return (requiredTermsindex.contains(index) ? "[필수] " : "[선택] ") +
        TermList[index];
  }

  handlePageChangeLogin() {
    navigateToPage(
      context,
      const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        height: 240,
                        width: 240,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.serviceTermsImage),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColors.lightPinkColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        allCheckedOnChange(!isAllChecked);
                                      },
                                      child: Row(
                                        children: [
                                          Transform.translate(
                                            offset: const Offset(0, 2),
                                            child: SizedBox(
                                              height: 24,
                                              width: 48,
                                              child: Checkbox(
                                                value: isAllChecked,
                                                onChanged: (value) =>
                                                    allCheckedOnChange(value),
                                                checkColor: Colors.white,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                  CustomColors.subColor,
                                                ),
                                                side: const BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            "모두 동의",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: CustomColors.defaultColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 12),
                                      child: Icon(
                                        Icons.check,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: CustomColors.lightPinkColor,
                              ),
                              ...List.generate(
                                TermList.length,
                                (index) => CheckboxAndTerms(
                                  title: termTitle(index),
                                  isChecked: isCheckedTermId[index],
                                  onChanged: ((value) =>
                                      onCheckboxChanged(index, value)),
                                  onIconTap: () {
                                    print(TermList[index]);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: CustomElevatedButton(
                        onPressed:
                            isBtnEnable == true ? handlePageChangeLogin : null,
                        text: "회원가입 완료",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TodoScream",
                    style: TextStyle(
                      color: CustomColors.defaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 12,
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
