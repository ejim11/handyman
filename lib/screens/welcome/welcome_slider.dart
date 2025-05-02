import 'package:flutter/material.dart';
import 'package:handyman/widgets/welcome/welcome_carousel.dart';

class WelcomeSlider extends StatefulWidget {
  const WelcomeSlider({super.key});

  @override
  State<WelcomeSlider> createState() {
    return _WelcomeSliderState();
  }
}

class _WelcomeSliderState extends State<WelcomeSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: const Size(0, 0),
                ),
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromRGBO(138, 150, 226, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const WelcomeCarousel()
        ],
      ),
    );
  }
}
