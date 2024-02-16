import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:image_app/constants/constants.dart';
import 'package:image_app/services/assets_manager.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: TextWidget(
                            label: msg,
                            color: Colors.indigo,
                          ),
                      )
                      : shouldAnimate
                          ? Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: DefaultTextStyle(
                                style: const TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                child: AnimatedTextKit(
                                    isRepeatingAnimation: false,
                                    repeatForever: false,
                                    displayFullTextOnTap: true,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        msg.trim(),
                                      ),
                                    ]),
                              ),
                          )
                          : Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: Text(
                                msg.trim(),
                                style: const TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                          ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          // Icon(
                          //   Icons.thumb_up_alt_outlined,
                          //   color: Colors.white,
                          // ),
                          SizedBox(
                            width: 5,
                          ),
                          // Icon(
                          //   Icons.thumb_down_alt_outlined,
                          //   color: Colors.white,
                          // )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
