import 'package:flutter/material.dart';
import 'package:handyman/screens/welcome/welcome_slider.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() {
    return _LogoScreenState();
  }
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Check if the widget is still mounted before navigating

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeSlider()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(53, 65, 141, 1),
      child: Center(
        child: Text(
          'LOGO',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
