import 'package:flutter/material.dart';
import 'package:handyman/screens/welcome/logo_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the widget is still mounted before navigating

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LogoScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Center(
          child: LoadingAnimationWidget.inkDrop(
              color: const Color.fromRGBO(50, 68, 185, 1), size: 50)),
    );
  }
}
