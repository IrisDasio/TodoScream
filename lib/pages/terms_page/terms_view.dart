import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/common/components/background_img.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [BackgroundImage()]),
    );
  }
}
