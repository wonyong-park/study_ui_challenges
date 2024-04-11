import 'package:flutter/material.dart';

class ReplyButton extends StatelessWidget {
  final int replyCount;

  const ReplyButton({required this.replyCount, super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: const BorderSide(color: Colors.black, width: 0.5),
        ),
        onPressed: () {},
        child: Text(
          'Read ${replyCount.toString()} replies',
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
