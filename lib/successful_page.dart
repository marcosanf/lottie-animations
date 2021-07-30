import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessfulPage extends StatefulWidget {
  const SuccessfulPage({Key? key}) : super(key: key);

  @override
  _SuccessfulPageState createState() => _SuccessfulPageState();
}

class _SuccessfulPageState extends State<SuccessfulPage> {
  bool isAnimationChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRender(),
          ],
        ),
      ),
    );
  }

  Widget buildRender() {
    if (isAnimationChanged) {
      return Lottie.asset(
        'assets/lottie/check2.json',
        repeat: false,
        reverse: false,
      );
    }

    buildTransaction();
    return Lottie.asset(
      'assets/lottie/check.json',
      repeat: true,
    );
  }

  Future<void> buildTransaction() async {
    await Future.delayed(const Duration(seconds: 20));
    setState(() {
      isAnimationChanged = true;
    });
  }
}
