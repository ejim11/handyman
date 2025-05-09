import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:handyman/data/welcome_messages.dart';
import 'package:handyman/screens/auth/auth_screen.dart';

class WelcomeCarousel extends StatelessWidget {
  const WelcomeCarousel(
      {super.key,
      required this.activeIndex,
      required this.buttonCarouselController,
      required this.onPageChanged,
      required this.paginateBack,
      required this.paginateForward});

  final int activeIndex;
  final CarouselSliderController buttonCarouselController;
  final void Function(int index) onPageChanged;
  final void Function() paginateBack;
  final void Function() paginateForward;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) => {onPageChanged(index)},
            autoPlay: false,
            height: 500,
            padEnds: false,
            viewportFraction: 1,
          ),
          items: messages.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.imagePath,
                        height: 300,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 28,
                            color: const Color.fromRGBO(79, 97, 211, 1),
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Center(
          child: Container(
            width: 72,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final (i, _) in messages.indexed)
                  Container(
                    width: 10,
                    height: 10,
                    margin: i == messages.length
                        ? null
                        : const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: i == activeIndex
                              ? const Color.fromRGBO(79, 97, 211, 1)
                              : const Color.fromRGBO(115, 121, 126, 1),
                          width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: i == activeIndex
                              ? const Color.fromRGBO(79, 97, 211, 1)
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        if (activeIndex < 2)
          Row(
            mainAxisAlignment: activeIndex == 1
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            children: [
              if (activeIndex == 1)
                IconButton.outlined(
                  iconSize: 30,
                  color: const Color.fromRGBO(79, 97, 211, 1),
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(
                      const BorderSide(
                        color: Color.fromRGBO(
                            79, 97, 211, 1), // Match border to icon color
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: paginateBack,
                  icon: const Icon(FeatherIcons.arrowLeft),
                ),
              IconButton.filled(
                iconSize: 30,
                color: Colors.white,
                onPressed: paginateForward,
                style: IconButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(79, 97, 211, 1),
                ),
                icon: const Icon(FeatherIcons.arrowRight),
              )
            ],
          )
        else
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(40, 49, 106, 0.25),
                  offset: Offset(0, 12),
                  blurRadius: 24,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(79, 97, 211, 1),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AuthScreen(
                            headerText: 'Welcome Back!',
                            subText: 'Sign in into your account',
                          )),
                );
              },
              child: Text(
                'Get Started',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
      ],
    );
  }
}
