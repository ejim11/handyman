import 'package:carousel_slider/carousel_controller.dart';
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
  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  var _activeIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  void paginateBack() {
    setState(() {
      _activeIndex = 0;
      buttonCarouselController.animateToPage(0);
    });
  }

  void paginateForward() {
    setState(() {
      if (_activeIndex == 1) {
        _activeIndex = 2;
        buttonCarouselController.animateToPage(2);
        return;
      }
      _activeIndex = 1;
      buttonCarouselController.animateToPage(1);
    });
  }

  void skipPages() {
    setState(() {
      _activeIndex = 2;
      buttonCarouselController.animateToPage(2);
    });
  }

  void goBackToFirstPage() {
    setState(() {
      _activeIndex = 0;
      buttonCarouselController.animateToPage(0);
    });
  }

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
            mainAxisAlignment: _activeIndex != 2
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (_activeIndex == 2)
                TextButton(
                  onPressed: goBackToFirstPage,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: const Size(0, 0),
                  ),
                  child: Text(
                    'Go Back',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color.fromRGBO(138, 150, 226, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              if (_activeIndex != 2)
                TextButton(
                  onPressed: skipPages,
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
          WelcomeCarousel(
            activeIndex: _activeIndex,
            buttonCarouselController: buttonCarouselController,
            onPageChanged: onPageChanged,
            paginateBack: paginateBack,
            paginateForward: paginateForward,
          )
        ],
      ),
    );
  }
}
