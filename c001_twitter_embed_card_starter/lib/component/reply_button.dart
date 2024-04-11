import 'package:flutter/material.dart';

class ReplyButton extends StatelessWidget {
  const ReplyButton({super.key});

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
        child: const Text(
          'Read 12 replies',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
