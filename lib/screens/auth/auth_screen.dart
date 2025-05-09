import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen(
      {super.key, required this.headerText, required this.subText});

  final String headerText;
  final String subText;

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  String _authState = 'Sign In';

  @override
  Widget build(BuildContext context) {
    List<String> authBtnTexts = ['Sign In', 'Sign Up'];

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...authBtnTexts.map((text) {
                return Container(
                  margin: const EdgeInsets.only(right: 28),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _authState = text;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: const Size(0, 0),
                        ),
                        child: Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: _authState == text
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : const Color.fromRGBO(
                                              173, 181, 189, 1),
                                  fontSize: 20,
                                  fontWeight: _authState == text
                                      ? FontWeight.w700
                                      : FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 4,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: _authState == text
                              ? Theme.of(context).colorScheme.onPrimary
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
