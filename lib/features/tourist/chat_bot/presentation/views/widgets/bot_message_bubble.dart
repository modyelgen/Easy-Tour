import 'package:flutter/material.dart';
import 'package:prepare_project/core/utilities/basics.dart';
class OtherChatBubble extends StatelessWidget {
  const OtherChatBubble({Key? key,required this.message,required this.isLoading,required this.replacedMessage}) : super(key: key);
  final String message;
  final bool isLoading;
  final String replacedMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(
            12,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: thirdColor ,
          ),
          child:
          // isLoading?
          // AnimatedTextKit(
          //     totalRepeatCount: 1,
          //     isRepeatingAnimation: false,
          //     animatedTexts: [
          //       TyperAnimatedText(message.replaceAll(replacedMessage, '',),textStyle: const TextStyle(color: basicColor))
          //     ]):
          Text(message.replaceAll(replacedMessage, '',),style: const TextStyle(color: basicColor),),
        ),
      ),
    );
  }
}